   title    "dcccan.asm - DCC accessory packet to CBUS short event"
   list     p=18F2480
   radix    dec

;**********************************************************************
;                                                                     *
;    Description:   DCC accessory packet to CBUS short event.         *
;                                                                     *
;    Author:        Chris White M819 whitecf69@gmail.com              *
;                                                                     *
;**********************************************************************
;                                                                     *
;   Generate a CBUS short event message for accessory packet received *
;   on DCC bus.                                                       *
;                                                                     *
;   Received DCC packets and outgoing CBUS events are buffered in     *
;   cyclic queues each occupying a dedicated RAM banks.               *
;   Both queues have 16 slots each of 16 bytes to give a total of 256 *
;   bytes. This simplifies indexing arithmetic as the 8 bit indices   *
;   will rollover from 255 back to 0.                                 *
;                                                                     *
;   FSR0 is dedicated to accesses the received DCC packet queue.      *
;   Outside interrupts FSR1 accesses both the received DCC packet and *
;   CBUS event transmission queues.                                   *
;                                                                     *
;**********************************************************************
;                                                                     *
;    5 Jun 2025 - Chris White:                                        *
;       Created new MPLABX project with empty source file.            *
;                                                                     *
;**********************************************************************
;                                                                     *
;                             +---+ +---+                             *
;                        !MCLR| 1 |_| 28|RB7 -> Green LED (SLiM)      *
;                          RA0| 2     27|RB6 -> Yellow LED (FLiM)     *
;                          RA1| 3     26|RB5                          *
;                          RA2| 4     25|RB4                          *
;                          RA3| 5     24|RB3 <- CANRx                 *
;                          RA4| 6     23|RB2 -> CANTx                 *
;     Setup push button -> RA5| 7     22|RB1                          *
;                    0V -> VSS| 8     21|RB0(INT0) <- DCC             *
;                    Resonator| 9     20|VDD <- +5V                   *
;                    Resonator|10     19|VSS <- 0V                    *
;                          RC0|11     18|RC7                          *
;                          RC1|12     17|RC6                          *
;                          RC2|13     16|RC5                          *
;                          RC3|14     15|RC4                          *
;                             +---------+                             *
;                                                                     *
;**********************************************************************


;**********************************************************************
; Include and configuration directives

  nolist
  include <p18f2480.inc>
  list

; Oscillator Switchover mode disabled
; Fail-Safe Clock Monito disabled
; HS oscillator, PLL enabled - 4 MHz resonator gives 16MHz clock
  config  IESO = OFF, FCMEN = OFF, OSC = HSPLL
; Brown-out Reset 4.6V
; Brown-out Reset enabled in hardware only
; Power-up Timer enabled
  config  BORV = 0, BOREN = BOHW, PWRT = ON
; Watchdog Timer disabled
  config  WDT = OFF
; !MCLR pin enabled
; Low-Power Timer1 higher power operation
; PORTB A/D disabled
  config  MCLRE = ON, LPT1OSC = OFF, PBADEN = OFF
; Background Debugger disabled
; Extended Instruction Set disabled
; Single-Supply ICSP disabled
; Stack Full/Underflow Reset enabled
  config  DEBUG = OFF, XINST = OFF, LVP = OFF, STVREN = ON
; Code not code protected
  config  CP0 = OFF, CP1 = OFF, CPB = OFF
; Data EEPROM not code protected
  config  CPD = OFF
; Block 0,1 not write protected
  config  WRT0 = OFF, WRT1 = OFF
; Data EEPROM not write protected
; Boot block not write protected
; Configuration register not write protected
  config  WRTD = OFF, WRTB = OFF, WRTC = OFF
; Block 0,1 not table read protected
  config  EBTR0 = OFF, EBTR1 = OFF
; Boot block not table read protected
  config EBTRB = OFF


;**********************************************************************
; Constants and definitions
;**********************************************************************

  nolist
  include "cbuslib/cbusdefs.inc"
  list

MANUFACTURER_ID               equ MANU_MERG
FIRMWARE_MAJOR_VERSION        equ 1
FIRMWARE_MINOR_VERSION        equ "a"
MODULE_TYPE                   equ 99
NUMBER_OF_EVENTS              equ 0
VARIABLES_PER_EVENT           equ 0
NUMBER_OF_HASH_TABLE_ENTRIES  equ 0
NUMBER_OF_NODE_VARIABLES      equ 0
NODE_FLAGS                    equ PF_PRODUCER

CPU_TYPE  equ P18F2480
BETA      equ 1                 ; Firmware beta version (numeric, 0 = Release)

MAXIMUM_NUMBER_OF_CAN_IDS  equ 100  ; Maximum CAN Ids allowed in a CAN segment

NODE_TYPE_PARAMETER  equ 0x0810
NODE_PARAMETERS      equ 0x0820
EEPROM_DATA          equ 0xF00000
BOOTLOAD_EE          equ 0xF000FE

NUMBER_OF_NODE_PARAMETERS  equ     24
AFTER_NODE_PARAMETERS      equ NODE_PARAMETERS + NUMBER_OF_NODE_PARAMETERS

FLIM_LED_PORT  equ LATB
FLIM_LED_BIT   equ 6            ; Yellow LED
#define  FLiM_LED         FLIM_LED_PORT, FLIM_LED_BIT
#define  Set_FLiM_LED_On  bsf FLiM_LED
#define  Set_FLiM_LED_Off bcf FLiM_LED

SLIM_LED_PORT  equ LATB
SLIM_LED_BIT   equ 7            ; Green LED
#define  SLiM_LED         SLIM_LED_PORT, SLIM_LED_BIT
#define  Set_SLiM_LED_On  bsf SLiM_LED
#define  Set_SLiM_LED_Off bcf SLiM_LED

#define  SETUP_INPUT PORTA, 5   ; Setup Switch
#define  DCC_INPUT   PORTB,INT0

DCC_PREAMBLE_COUNT  equ 10
DCC_BYTE_BIT_COUT   equ  8
#define  DCC_SYNCHRONISE_FLAG  mode_and_state, 7

DCC_ACC_BYTE1_MASK        equ b'11000000'
DCC_ACC_BYTE1_TEST        equ b'10000000'
DCC_BASIC_ACC_BYTE2_MASK  equ b'10001000'
DCC_BASIC_ACC_BYTE2_TEST  equ b'10001000'
DCC_PACKET_LENGTH         equ 3

PACKET_RX_QUEUE_START        equ 0x100
PACKET_RX_QUEUE_SLOT_LENGTH  equ 16

EVENT_TX_QUEUE_START        equ 0x200
EVENT_TX_QUEUE_SLOT_LENGTH  equ 16


  nolist
  include   "cbuslib/boot_loader.inc"
  list


;**********************************************************************
; Variable definitions

  CBLOCK  ; Follow on from boot loader RAM, which starts at 0

  ; Store for register values during high priority interrput
  hpint_STATUS
  hpint_W

  mode_and_state             ; bit 7 - Synchronising to end of preamble

  dcc_preamble_downcounter
  dcc_byte_bit_downcounter
  dcc_rx_checksum
  dcc_rx_byte_count

  dcc_packet_rx_queue_insert
  dcc_packet_rx_queue_extract

  event_tx_queue_insert
  event_tx_queue_extract

  event_opcode
  event_num_low
  event_num_high

  ENDC
#if (0xFF) < (event_num_high)
    error "RAM allocation beyond end of Bank 0"
#endif


;**********************************************************************
; EEPROM initialisation


;**********************************************************************
; Start of program code

  org  NODE_TYPE_PARAMETER     ; Node type parameter

node_type_name
  db  "DCCCAN "

  org  NODE_PARAMETERS

node_parameters
  db  MANUFACTURER_ID, FIRMWARE_MINOR_VERSION, MODULE_TYPE
  db  NUMBER_OF_EVENTS, VARIABLES_PER_EVENT, NUMBER_OF_NODE_VARIABLES
  db  FIRMWARE_MAJOR_VERSION, NODE_FLAGS, CPU_TYPE, PB_CAN
  dw  initialisation        ; Load address for module code above bootloader
  dw  0                     ; Top 2 bytes of 32 bit address not used
  db  0, 0, 0, 0, CPUM_MICROCHIP, BETA

unused_node_parameters
  FILL 0, parameter_count - $ ; Zero fill unused parameter space

NODE_PARAMETER_COUNT equ unused_node_parameters - node_parameters

NODE_PARAMETER_CHECKSUM  set                           MANUFACTURER_ID
NODE_PARAMETER_CHECKSUM  set NODE_PARAMETER_CHECKSUM + FIRMWARE_MINOR_VERSION
NODE_PARAMETER_CHECKSUM  set NODE_PARAMETER_CHECKSUM + MODULE_TYPE
NODE_PARAMETER_CHECKSUM  set NODE_PARAMETER_CHECKSUM + NUMBER_OF_EVENTS
NODE_PARAMETER_CHECKSUM  set NODE_PARAMETER_CHECKSUM + VARIABLES_PER_EVENT
NODE_PARAMETER_CHECKSUM  set NODE_PARAMETER_CHECKSUM + NUMBER_OF_NODE_VARIABLES
NODE_PARAMETER_CHECKSUM  set NODE_PARAMETER_CHECKSUM + FIRMWARE_MAJOR_VERSION
NODE_PARAMETER_CHECKSUM  set NODE_PARAMETER_CHECKSUM + NODE_FLAGS
NODE_PARAMETER_CHECKSUM  set NODE_PARAMETER_CHECKSUM + CPU_TYPE
NODE_PARAMETER_CHECKSUM  set NODE_PARAMETER_CHECKSUM + PB_CAN
NODE_PARAMETER_CHECKSUM  set NODE_PARAMETER_CHECKSUM + high node_type_name
NODE_PARAMETER_CHECKSUM  set NODE_PARAMETER_CHECKSUM + low node_type_name
NODE_PARAMETER_CHECKSUM  set NODE_PARAMETER_CHECKSUM + high initialisation
NODE_PARAMETER_CHECKSUM  set NODE_PARAMETER_CHECKSUM + low initialisation
NODE_PARAMETER_CHECKSUM  set NODE_PARAMETER_CHECKSUM + NODE_PARAMETER_COUNT

  org  AFTER_NODE_PARAMETERS

parameter_count
  dw  NODE_PARAMETER_COUNT     ; Number of parameters implemented

module_name
  dw  node_type_name           ; Pointer to module type name
  dw  0                        ; Top 2 bytes of 32 bit address not used

parameter_checksum
  dw  NODE_PARAMETER_CHECKSUM  ; Checksum of parameters


;**********************************************************************
high_priority_interrupt

  ; Protect register values during interrupt
  movff   STATUS, hpint_STATUS
  movwf   hpint_W

  btfss   INTCON, INT0IF
  bra     exit_high_priority_interrupt

  ; DCC input has changed
  btfss   DCC_INPUT
  bra     end_of_dcc_bit

start_of_dcc_bit
  bcf     INTCON2, INTEDG0  ; Next interrupt on falling edge, end of DCC bit

  ; Initialise bit duration timing
  clrf    TMR0H
  movlw   1                 ; Adjust for interrupt processing latencies
  movwf   TMR0L
  bsf     T0CON, TMR0ON     ; Enable Timer 0
  bra     dcc_bit_done

end_of_dcc_bit
  bsf     INTCON2, INTEDG0  ; Next interrupt on rising edge, start of DCC bit

  bcf     T0CON, TMR0ON     ; Stop Timer 0

  movf    TMR0L, F          ; Read TMR0L in order to update TMR0H

  movlw   high (10000 + 1)
  cpfslt  TMR0H
  bra     dcc_packet_bad    ; Longer than allowed for 0 half bit

  tstfsz  TMR0H
  bra     seen_dcc_zero     ; Longer than 255 uSec so must be 0 half bit

  movlw   low (90 - 1)
  cpfsgt  TMR0L
  bra     not_dcc_zero      ; Shorter than 90 uSec so cannot be 0 half bit

seen_dcc_zero
  tstfsz  dcc_preamble_downcounter  ; Skip if already seen minimum preamble
  bra     dcc_packet_bad            ; Zero seen whilst still expecting preamble

  bcf     STATUS, C
  tstfsz  dcc_byte_bit_downcounter  ; Skip if not currently receiving a byte
  bra     shift_dcc_bit_into_byte

start_of_dcc_byte
  movlw   PACKET_RX_QUEUE_SLOT_LENGTH
  addwf   dcc_packet_rx_queue_insert, W
  xorwf   dcc_packet_rx_queue_extract, W
  btfsc   STATUS, Z         ; Skip if packet Rx queue is not full
  bra     dcc_packet_bad

  bcf     DCC_SYNCHRONISE_FLAG
  movlw   DCC_BYTE_BIT_COUT
  movwf   dcc_byte_bit_downcounter
  bra     dcc_bit_done

not_dcc_zero
  movlw   low (64 + 1)
  cpfslt  TMR0L
  bra     dcc_packet_bad    ; Longer than allowed for 1 half bit

  movlw   low (52 - 1)
  cpfsgt  TMR0L
  bra     dcc_packet_bad    ; Shorter than 52 uSec so cannot be 1 half bit

seen_dcc_one
  btfss   DCC_SYNCHRONISE_FLAG
  bra     not_dcc_preamble

receiving_dcc_preamble
  decf    dcc_preamble_downcounter, W
  btfsc   STATUS, C         ; Avoid underflow from zero
  movwf   dcc_preamble_downcounter
  bra     dcc_bit_done

not_dcc_preamble
  bsf     STATUS, C
  tstfsz  dcc_byte_bit_downcounter  ; Skip if not receiving a byte
  bra     shift_dcc_bit_into_byte

end_of_dcc_packet
  tstfsz  dcc_rx_checksum   ; Skip if checksum verification passes
  bra     dcc_packet_bad

  ; Store packet length in last byte of slot
  movlw   PACKET_RX_QUEUE_SLOT_LENGTH - 1
  iorwf   FSR0L, F
  movff   dcc_rx_byte_count, INDF0

  ; Advance insert offset to start of next slot, wrap round end of queue
  movlw   PACKET_RX_QUEUE_SLOT_LENGTH
  addwf   dcc_packet_rx_queue_insert, F

  movlw   DCC_PREAMBLE_COUNT - 1    ; End of packet marker counts as preamble

dcc_packet_done
  movwf   dcc_preamble_downcounter  ; Set minimum length of preamble required
  bsf     DCC_SYNCHRONISE_FLAG
  clrf    dcc_byte_bit_downcounter
  clrf    dcc_rx_checksum
  clrf    dcc_rx_byte_count
  movff   dcc_packet_rx_queue_insert, FSR0L
  bra     dcc_bit_done

dcc_packet_bad
  movlw   DCC_PREAMBLE_COUNT
  bra     dcc_packet_done

shift_dcc_bit_into_byte
  rlcf    INDF0, F
  decfsz  dcc_byte_bit_downcounter, F
  bra     dcc_bit_done      ; Still receiving byte

  movf    INDF0, W
  xorwf   dcc_rx_checksum, F

  incfsz  dcc_rx_byte_count, W
  movwf   dcc_rx_byte_count

  incf    FSR0L, F
  movlw   PACKET_RX_QUEUE_SLOT_LENGTH - 1
  andwf   FSR0L, W
  btfsc   STATUS, Z         ; Skip if not past end of slot
  bra     dcc_packet_bad

dcc_bit_done
  bcf     INTCON, INT0IF    ; Re-enable INT0 interrupts

exit_high_priority_interrupt
  ; Restore register values protected during interrupt
  movf    hpint_W, W
  movff   hpint_STATUS, STATUS
  retfie


;**********************************************************************
low_priority_interrupt
exit_low_priority_interrupt

  retfie


;**********************************************************************
clear_ram_loop

  clrf    POSTINC0
  tstfsz  FSR0L
  bra     clear_ram_loop

  return


;**********************************************************************
initialisation

  clrf    INTCON            ; Disable interrupts

  bsf     RCON, IPEN        ; Enable interrupt priority levels
  clrf    INTCON3
  clrf    INTCON2           ; Pullups enabled on PORTB inputs
                            ; INT0 interrupt on falling edge

  lfsr    FSR0, 0x000       ; Clear data memory bank 0
  call    clear_ram_loop
  lfsr    FSR0, PACKET_RX_QUEUE_START
  call    clear_ram_loop
  lfsr    FSR0, EVENT_TX_QUEUE_START
  call    clear_ram_loop

  ; Turn off  A/D, all bits digital I/O
  clrf    ADCON0
  movlw   b'00001111'
  movwf   ADCON1

  clrf    LATA
  movlw   b'00100000'       ; PortA bit 5 (RA5), setup pushbutton input
  movwf   TRISA

  clrf    LATB
  movlw   b'00001001'       ; PortB: bit 7 (RB7), Green (SLiM) LED output
                            ;        bit 6 (RB6), Yellow (FLiM) LED output
                            ;        bit 3 (RB3), CAN Rx input
                            ;        bit 2 (RB2), CAN Tx output
                            ;        bit 0 (RB0), DCC input
  movwf   TRISB
  Set_FLiM_LED_Off
  Set_SLiM_LED_Off
  bsf     LATB,CANTX        ; Initialise CAN Tx as recessive

  clrf    LATC
  clrf    TRISC             ; Port C all outputs

  clrf    EECON1            ; Disable accesses to program memory

  banksel CANCON
  bsf     CANCON,REQOP2     ; Request CAN module configure mode

can_config_wait
  btfss   CANSTAT,OPMODE2   ; Skip if CAN module in configure mode ...
  bra     can_config_wait   ; ... else wait

  ; Set CAN bit rate and sample point

  movlw   b'00000011'       ; Synchronisation jump width = 1 Tq
                            ; Tq = 8/Fosc
  movwf   BRGCON1

  movlw   b'11011110'       ; Phase segment 2 freely programmable, SEG2PHTS
                            ; Bus sampled three times up to sample point
                            ; Phase segment 1 = 4 Tq
                            ; Propogation segment = 7 Tq
  movwf   BRGCON2

  movlw   b'00000011'       ; Enable bus activity wake up
                            ; Bus line filter not used for wake up
                            ; Phase segment 2 (4 Tq) but ignored as ...
                            ; ... SEG2PHTS is set so = Phase segment 1 (4 Tq)
  movwf   BRGCON3

  ; Sum of segments (syncronisation fixed at 1 Tq) = 16 Tq => 125,000 Kb/s, ...
  ; ... sample point is nominally 12 Tq = 75% of nominal bit time

  movlw   b'00100000'       ; CAN Tx to Vdd when recesive
                            ; Disable message capture
  movwf   CIOCON

  movlw   b'10110000'       ; Mode 2, enhanced FIFO
                            ; FIFO interrupt on 1 Rx buffer remaining
                            ; Initially map Rx buffer 0 into Access Bank
  movwf   ECANCON

  movlw   b'00100100'       ; Receive valid messages as per acceptance filters
  movwf   RXB0CON

  clrf    RXB1CON           ; Receive valid messages as per acceptance filters

  clrf    RXF0SIDL
  clrf    RXF1SIDL

  lfsr    FSR0, RXM0SIDH    ; Clear Rx acceptance masks
  movlw   low RXM1EIDL + 1

clear_rx_masks_loop
  clrf    POSTINC0
  cpfseq  FSR0L
  bra     clear_rx_masks_loop

  movlw b'10111111'
  movwf TXB1SIDH
  movlw b'11100000'
  movwf TXB1SIDL

  clrf    CANCON            ; Request CAN module normal mode

can_normal_wait
  movf    CANSTAT,W
  andlw   b'11100000'       ; Mask out all except operation mode bits
  bnz     can_normal_wait   ; Loop if CAN module not in normal mode

  bcf     COMSTAT, RXB0OVFL ; Ensure overflow flags are clear
  bcf     COMSTAT, RXB1OVFL

  movlb   0                 ; CAN setup complete, select RAM bank 0

  movlw   b'00000001'       ; Timer 0: Stopped
                            ;          16 bit
                            ;          Internal, 0.25 uSec, clock (Fosc/4)
                            ;          Assign 1:4 prescaler, 1 uSec tick
  movwf   T0CON

  lfsr    FSR0, PACKET_RX_QUEUE_START

  movlw   low PACKET_RX_QUEUE_START
  movwf   dcc_packet_rx_queue_insert
  movwf   dcc_packet_rx_queue_extract

  movlw   low EVENT_TX_QUEUE_START
  movwf   event_tx_queue_insert
  movwf   event_tx_queue_extract

  ; DCC reception to start seeking new packet on next rising edge
  bsf     INTCON2, INTEDG0  ; Next interrupt on rising edge, start of DCC bit
  bsf     DCC_SYNCHRONISE_FLAG
  movlw   DCC_PREAMBLE_COUNT
  movwf   dcc_preamble_downcounter
  clrf    dcc_byte_bit_downcounter
  clrf    dcc_rx_checksum
  clrf    dcc_rx_byte_count

slim_setup
  Set_FLiM_LED_Off
  Set_SLiM_LED_On

  movlw   b'10010000'       ; Enable high priority interrupts
                            ; Disable low priority peripheral interrupts
                            ; Disable TMR0 overflow interrupt
                            ; Enable INT0 external interrupt
                            ; Disable Port B change interrupt
  movwf   INTCON

  ; Drop through to main_loop


;**********************************************************************
main_loop
  clrwdt

  call    enqueue_cbus_event_for_tx
  call    transmit_next_cbus_event

  bra     main_loop


;**********************************************************************
enqueue_cbus_event_for_tx

  movlw   EVENT_TX_QUEUE_SLOT_LENGTH
  addwf   event_tx_queue_insert, W
  xorwf   event_tx_queue_extract, W
  btfsc   STATUS, Z         ; Skip if event Tx queue is not full
  return

  movf    dcc_packet_rx_queue_insert, W
  xorwf   dcc_packet_rx_queue_extract, W
  btfsc   STATUS, Z         ; Skip if packet Rx queue is not empty
  return

  lfsr    FSR1, PACKET_RX_QUEUE_START
  movlw   PACKET_RX_QUEUE_SLOT_LENGTH - 1
  iorwf   dcc_packet_rx_queue_extract, W
  movwf   FSR1L

  movlw   DCC_PACKET_LENGTH
  cpfseq  INDF1             ; Skip if got expected byte count for packet
  bra     skip_dcc_packet

  movff   dcc_packet_rx_queue_extract, FSR1L

  movlw   DCC_ACC_BYTE1_MASK
  andwf   INDF1, W
  xorlw   DCC_ACC_BYTE1_TEST
  btfss   STATUS, Z         ; Skip if first byte verification passes
  bra     skip_dcc_packet

  incf    FSR1L             ; FSR1 points to second byte of queued packet

  movlw   DCC_BASIC_ACC_BYTE2_MASK
  andwf   INDF1, W
  xorlw   DCC_BASIC_ACC_BYTE2_TEST
  btfss   STATUS, Z         ; Skip if second byte verification passes
  bra     skip_dcc_packet

  ; Decode simple accessory decoder output address from RCN-213
  ;
  ; 10AAAAAA 1aaaCDDd
  ;   ||||||  +++ |||  DCC address bits 8 to 6 (Acc 10 - 8), one's complemented
  ;   ++++++      |||  DCC address bits 5 to 0 (Acc 7 - 2)
  ;               ++|  Accessory output pair index (Acc 1 - 0), range 0 to 3
  ;                 +  Accessory indexed pair output, range 0 to 1
  ;
  ; DCC base address   (9 bits)   = 000a aaAA AAAA
  ; Accessory address (11 bits)   = 0aaa AAAA AADD
  ; Output address    (12 bits)   = aaaA AAAA ADDd
  ; Event nummber, toggling pairs = Accessory address - b'0100' (4)
  ; For toggling pairs output bit, d, not activation bit, C selects On or Off

  ; aaa
  swapf   POSTDEC1, W       ; FSR1 points to first byte of queued packet
  andlw   b'00000111'
  xorlw   b'00000111'
  movwf   event_num_high

  ; AA AAAA
  rlncf   INDF1, F
  rlncf   POSTINC1, W       ; FSR1 points to second byte of queued packet
  andlw   b'11111100'
  movwf   event_num_low

  ; DD
  rrncf   INDF1, W
  andlw   b'00000011'
  iorwf   event_num_low, F

  ; d
  movlw   OPC_ASOF
  btfsc   INDF1, 0          ; d = 0, activate first output of a pair = ASOF
  movlw   OPC_ASON          ; d = 1, activate second output of a pair = ASON
  movwf   event_opcode

  ; Event number now 0000 0aaa AAAA AADD (accessory address)
  ; DCC addresses start at 1, map this to event number 0 by subtracting 4
  movlw   4
  subwf   event_num_low, F
  btfss   STATUS, C         ; Skip if no underflow on low byte ...
  decf    event_num_high, F ; ... else borrow from high byte

  ; Enqueue event
  lfsr    FSR1, EVENT_TX_QUEUE_START
  movff   event_tx_queue_insert, FSR1L

  movff   event_opcode, POSTINC1
  clrf    POSTINC1          ; Node number high
  clrf    POSTINC1          ; Node number low
  movff   event_num_high, POSTINC1
  movff   event_num_low, INDF1

  ; Advance event insert offset to start of next slot, wrap round end of queue
  movlw   EVENT_TX_QUEUE_SLOT_LENGTH
  addwf   event_tx_queue_insert, F

skip_dcc_packet
  ; Advance packet extract offset to start of next slot, wrap round end of queue
  movlw   PACKET_RX_QUEUE_SLOT_LENGTH
  addwf   dcc_packet_rx_queue_extract, F

  return

;**********************************************************************
transmit_next_cbus_event

  btfsc   TXB1CON, TXREQ
  return

  movf    event_tx_queue_insert, W
  xorwf   event_tx_queue_extract, W
  btfsc   STATUS, Z         ; Skip if event Tx queue is not empty
  return

  lfsr    FSR1, EVENT_TX_QUEUE_START
  movff   event_tx_queue_extract, FSR1L

  banksel TXB1D0

  ; Number of bytes for transmission derived from opcode
  swapf   INDF1, W
  rrncf   WREG, W
  andlw   0x07
  incf    WREG, W
  movwf   TXB1DLC

  movff   POSTINC1, TXB1D0  ; Opcode
  movff   POSTINC1, TXB1D1
  movff   POSTINC1, TXB1D2
  movff   POSTINC1, TXB1D3
  movff   POSTINC1, TXB1D4
  movff   POSTINC1, TXB1D5
  movff   POSTINC1, TXB1D6
  movff   INDF1, TXB1D7

  ; Advance event extract offset to start of next slot, wrap round end of queue
  movlw   EVENT_TX_QUEUE_SLOT_LENGTH
  addwf   event_tx_queue_extract, F

  bsf     TXB1CON, TXREQ

  return


;**********************************************************************
; EEPROM data

  org  EEPROM_DATA

ee_can_id
  de  b'01111111'
ee_module_status
  de 0
ee_node_id
  de  0, 0

  org  BOOTLOAD_EE

  de  0, 0


  end
