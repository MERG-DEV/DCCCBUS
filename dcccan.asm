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
;                          RA3| 5     24|CANRx <-                     *
;                          RA4| 6     23|CANTx ->                     *
;     Setup push button -> RA5| 7     22|RB1                          *
;                    0V -> VSS| 8     21|RB0                          *
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
BETA      equ 1            ; Firmware beta version (numeric, 0 = Release)

MAXIMUM_NUMBER_OF_CAN_IDS  equ 100  ; Maximum CAN Ids allowed in a CAN segment

RESET_VECTOR         equ 0x0800
HIGH_INT_VECTOR      equ 0x0808
NODE_TYPE_PARAMETER  equ 0x0810
LOW_INT_VECTOR       equ 0x0818
NODE_PARAMETERS      equ 0x0820
EEPROM_DATA          equ 0xF00000
BOOTLOAD_EE          equ 0xF000FE

NUMBER_OF_NODE_PARAMETERS  equ     24
AFTER_NODE_PARAMETERS      equ NODE_PARAMETERS + NUMBER_OF_NODE_PARAMETERS

FLIM_LED_PORT  equ LATB
FLIM_LED_BIT   equ 6  ; Yellow LED
#define  FLiM_LED         FLIM_LED_PORT, FLIM_LED_BIT
#define  Set_FLiM_LED_On  bsf FLiM_LED
#define  Set_FLiM_LED_Off bcf FLiM_LED

SLIM_LED_PORT  equ LATB
SLIM_LED_BIT   equ 7  ; Green LED
#define  SLiM_LED         SLIM_LED_PORT, SLIM_LED_BIT
#define  Set_SLiM_LED_On  bsf SLiM_LED
#define  Set_SLiM_LED_Off bcf SLiM_LED

#define  SETUP_INP    PORTA,5 ; Setup Switch

  nolist
  include   "cbuslib/boot_loader.inc"
  list


;**********************************************************************
; Variable definitions


;**********************************************************************
; EEPROM initialisation


;**********************************************************************
; Start of program code

  org   RESET_VECTOR
load_address
  nop           ;for debug
  goto  initialisation

  org   HIGH_INT_VECTOR
  goto  high_priority_interrupt_routine

  org  NODE_TYPE_PARAMETER     ; Node type parameter
node_type_name
  db  "DCCCAN "

  org   LOW_INT_VECTOR
  goto  low_priority_interrupt_routine

  org  NODE_PARAMETERS
node_parameters
  db  MANUFACTURER_ID, FIRMWARE_MINOR_VERSION, MODULE_TYPE
  db  NUMBER_OF_EVENTS, VARIABLES_PER_EVENT, NUMBER_OF_NODE_VARIABLES
  db  FIRMWARE_MAJOR_VERSION, NODE_FLAGS, CPU_TYPE, PB_CAN
  dw  RESET_VECTOR  ; Load address for module code above bootloader
  dw  0             ; Top 2 bytes of 32 bit address not used
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
NODE_PARAMETER_CHECKSUM  set NODE_PARAMETER_CHECKSUM + high RESET_VECTOR
NODE_PARAMETER_CHECKSUM  set NODE_PARAMETER_CHECKSUM + low RESET_VECTOR
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
high_priority_interrupt_routine
  retfie


;**********************************************************************
low_priority_interrupt_routine
  retfie


;**********************************************************************
initialisation
  clrf    INTCON            ; Disable interrupts

  ; Clear first page of RAM
  bankisel 0
  lfsr    FSR0, 0

ram_clear_loop
  clrf    POSTINC0
  tstfsz  FSR0L
  bra     ram_clear_loop

  ; Turn off Port A A/D, all bits digital I/O RA5 < Setup push button
  clrf    ADCON0
  movlw   b'00001111'
  movwf   ADCON1

  movlw   b'00100000'       ; PortA bit 5, setup pushbutton input
  movwf   TRISA

  movlw   b'00001100'       ; PortB bit 2, (RB2), CAN Tx output
                            ;       bit 3, (RB3) CAN Rx input
                            ;       bit 6, (RB6) Yellow (FLiM) LED output
                            ;       bit 7, (RB7) Green (SLiM) LED output
                            ; Pullups enabled on PORTB inputs
  movwf   TRISB
  Set_FLiM_LED_Off
  Set_SLiM_LED_Off
  bsf     LATB,CANTX        ; Initialise CAN Tx as recessive

  clrf    TRISC             ; Port C all outputs
  clrf    PORTC

  bsf     RCON, IPEN        ; Enable interrupt priority levels
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

  clrf    CANCON            ; Request CAN module normal mode

can_normal_wait
  movf    CANSTAT,W
  andlw   b'11100000'       ; Mask out all except operation mode bits
  bnz     can_normal_wait   ; Loop if CAN module not in normal mode

  bcf     COMSTAT, RXB0OVFL ; Ensure overflow flags are clear
  bcf     COMSTAT, RXB1OVFL

  movlb   0                 ; CAN setup complete, select RAM bank 0

slim_setup
  Set_FLiM_LED_Off
  Set_SLiM_LED_On

  ; Drop through to main_loop


;**********************************************************************
main_loop
  clrwdt
  goto  main_loop


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
