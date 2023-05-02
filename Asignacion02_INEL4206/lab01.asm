;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
;
;
;-------------------------------------------------------------------------------
            .cdecls C,LIST,"msp430.h"       ; Include device header file
            
;-------------------------------------------------------------------------------
            .def    RESET                   ; Export program entry-point to
                                            ; make it known to linker.
;-------------------------------------------------------------------------------
            .text                           ; Assemble into program memory.
            .retain                         ; Override ELF conditional linking
                                            ; and retain current section.
            .retainrefs                     ; And retain any sections that have
                                            ; references to current section.

	.global delay, count
;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer


;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------

		bic.b #LOCKLPM5, PM5CTL0

SetupP1:
	bic.b #00001000b, &P2DIR	;P2.3 as input
	bis.b #1, &P1DIR			;P1.0 as output
	bis.b #00001000b, &P2REN	;select internal resistor
	bis.b #00001000b, &P2OUT	;make it pull up

POLL:
	bit.b #00001000b, &P2IN		;poll 2.3
	jnz POLL
	call #main
	xor.b #1,&P1OUT 			; Toggle P1.0
	jmp POLL 					; again
	nop



main:
	xor.b #1,&P1OUT ; Toggle P1.0
	mov #65535, R15 ; Delay to R15
	call #L1
	;call #PBISR
	nop

L1:
	dec R15 		;decrement R15
	jnz L1  		;delay over?
	jmp main
	;reti
	;nop

PBISR 							;P2.3 ISR
	bic.b #00001000b, &P2IFG	;clear interrupt flag
	cmp #25000, delay			;compare
	jeq slow
	mov #25000, delay			;fast flashing rate
	reti

slow:
	mov #50000, delay			;slow fashing rate
	reti


;-------------------------------------------------------------------------------
; Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect   .stack
            
;-------------------------------------------------------------------------------
; Interrupt Vectors
;-------------------------------------------------------------------------------
            .sect   ".reset"                ; MSP430 RESET Vector
            .short  RESET
            
            .sect   PORT2_VECTOR			;P2 vector for PB
            .short  PBISR
            .end
