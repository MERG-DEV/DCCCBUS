   title    "$sema4.asm - Sema4 variant"
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
;                          RA3| 5     24|CANRX <-                     *
;                          RA4| 6     23|CANTX ->                     *
;                 Setup -> RA5| 7     22|RB1                          *
;                    0V -> VSS| 8     21|RB0                          *
;                          RA7| 9     20|VDD <- +5V                   *
;                          RA6|10     19|VSS <- 0V                    *
;                          RC0|11     18|RC7                          *
;                          RC1|12     17|RC6                          *
;                          RC2|13     16|RC5                          *
;                          RC3|14     15|RC4                          *
;                             +---------+                             *
;                                                                     *
;**********************************************************************


;**********************************************************************
; Include and configuration directives                                *
;**********************************************************************

  include <p18f2480.inc>

  CONFIG  FCMEN = OFF, OSC = HSPLL, IESO = OFF
  CONFIG  PWRT = ON, BOREN = BOHW, BORV = 0
  CONFIG  WDT = OFF
  CONFIG  MCLRE = ON
  CONFIG  LPT1OSC = OFF, PBADEN = OFF
  CONFIG  DEBUG = OFF
  CONFIG  XINST = OFF, LVP = OFF, STVREN = ON
  CONFIG  CP0 = OFF, CP1 = OFF, CPB = OFF, CPD = OFF
  CONFIG  WRT0 = OFF, WRT1 = OFF, WRTB = OFF, WRTC = OFF, WRTD = OFF
  CONFIG  EBTR0 = OFF, EBTR1 = OFF, EBTRB = OFF

; '__CONFIG' directive is used to embed configuration data within .asm file.
; The lables following the directive are located in the respective .inc file.
; See respective data sheet for additional information on configuration word.
; Selection is:

; Processor uses 4 MHz resonator with HSPLL to give a clock of 16MHz


;**********************************************************************
; Constant definitions                                                *
;**********************************************************************

  include "cbuslib/cbusdefs.inc"

RESET_VECTOR               equ  0x0800


  include   "cbuslib/boot_loader.inc"


;**********************************************************************
; Variable definitions                                                *
;**********************************************************************

;**********************************************************************
; EEPROM initialisation                                               *
;**********************************************************************


;******************************************************************************
;   Low priority interrupt.

low_priority_interrupt_routine


;******************************************************************************
;   High priority interrupt.

high_priority_interrupt_routine


    end
