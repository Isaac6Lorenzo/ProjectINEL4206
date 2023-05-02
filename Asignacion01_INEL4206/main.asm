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

	.global string, strNum, valueDec, count
z .word 0 ; count number
;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer


;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------

;	mov #string, R5
;	push R5
;	mov #0, R6
;count_number:
;    mov.b @R5+, R7
;	bic.b #0xF0, R7
;	cmp.b #0x0, R7
;	jge count
;	cmp.b #0x09, R7
;	jl count
;	jne done

;count:
;	inc R6
;	jmp count_number

;done:
;	mov R6, count
;   jmp $
;	nop

atoi2:
    mov #strNum, R12
    mov.b @R12+, r13
	bic.b #0xF0, r13 ; first digit
	mov.b @R12+, r14
	bic.b #0xF0, r14 ; second digit
	mov.b @R12, r15
	bic.b #0xF0, r15 ; third digit
	mov #100, &MPY
	mov r13, &OP2
	mov RESLO, R13
	mov #10, &MPY
	mov r14, &OP2
	mov RESLO, R14
	clr R12
	add R13, R12
	add R14, R12
	add R15, R12
    mov R12, valueDec
    jmp $
    nop

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
            
