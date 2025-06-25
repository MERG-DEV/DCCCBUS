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

FLIM_LED_PORT  equ PORTB
FLIM_LED_BIT   equ 6  ; Yellow LED
#define  FLiM_LED         FLIM_LED_PORT, FLIM_LED_BIT
#define  Set_FLiM_LED_On  bsf FLiM_LED
#define  Set_FLiM_LED_Off bcf FLiM_LED

SLIM_LED_PORT  equ PORTB
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
  movlb   15                ; Select RAM bank 15
  clrf    INTCON            ; Disable interrupts

  ; Clear first page of RAM
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

  ; RB2 > CANTx, RB3 < CANRx, RB6 > Yellow LED (FLiM), RB7 > Green LED (SLiM)
  movlw   b'00111000'       ; PortB bit 2, CAN Tx output
                            ;       bit 3, CAN Rx input
                            ;       bit 6, Yellow (FLiM) LED
                            ;       bit 7, Green (SLiM) LED
                            ; Pullups enabled on PORTB inputs
  movwf   TRISB
  Set_FLiM_LED_Off
  Set_SLiM_LED_Off
  bsf     PORTB,2           ; Initialise CAN Tx as recessive

  clrf    TRISC             ; Port C all outputs
  clrf    PORTC

  bsf     RCON, IPEN        ; Enable interrupt priority levels
  clrf    EECON1            ; Disable accesses to program memory
  clrf    ECANCON           ; CAN mode 0, legacy

  bsf     CANCON,7          ; CAN module into configure mode
  movlw   b'00000011'       ; Bit rate 125,000
  movwf   BRGCON1

  movlw   b'10011110'       ; Phase Segment 2 Time Freely Programmable
                            ; Bus sampled once at sample point
                            ; Phase Segment 1 Time 4 x Tq
                            ; Propogation Time 7 x Tq
  movwf   BRGCON2

  movlw   b'00000011'       ; Enable bus activity wake up
                            ; Bus filter not used for wake up
                            ; Phase Segment 2 Time 4 x Tq
  movwf   BRGCON3

  movlw   b'00100000'       ; CAN Tx to Vdd when recesive
                            ; Disable message capture
  movwf   CIOCON

  movlw   b'00100100'       ; Receive valid messages with standard identifier
                            ; Enable double buffer
                            ; Allow jump table offset between 1 and 10
                            ; Enable acceptance filter 0
  movwf   RXB0CON           ; Configure Rx buffer 0

  movlw   b'00100000'       ; Receive valid messages with standard identifier
  movwf   RXB1CON           ; Configure Rx buffer 1

  clrf    RXF0SIDL
  clrf    RXF1SIDL
  movlb   0                 ; Select RAM bank 0

  lfsr    FSR0, RXM0SIDH    ; Clear Rx acceptance masks
  movlw   low RXM1EIDL + 1

clear_rx_masks_loop
  clrf    POSTINC0
  cpfseq  FSR0L
  bra     clear_rx_masks_loop

  clrf    CANCON            ; CAN module out of configure mode

  bcf     COMSTAT, RXB0OVFL ; Ensure overflow flags are clear
  bcf     COMSTAT, RXB1OVFL

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
