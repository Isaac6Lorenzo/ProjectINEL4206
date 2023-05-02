;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
;
;
;Isaac Lorenzo Rodriguez Pacheco
;843157462
;Final Exam INEL 4206
;May 26, 2020

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

	.export  q4, q5

;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer


;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------

;  ---------- Question 1 ----------
; q4:
;	evaluate '3*x-10'
;	return result in R12
q4:
	mov R12, R13 		;pointer to the int x to mult
	mov #3, &MPY
	mov R13, &OP2
	mov RESLO, R12 		; 3 * X  in the register R12
	sub #10, R12 		; 3 x - 10 in the register R12
	ret					; return value storein R12


; ---------- Question 2 ----------
; q5:
;	Find the smallest number in array
;   Input: pointer to array in R12, array size in R13
;	Output: smallest element in R12
q5:
; YOUR INSTRUCTIONS GO HERE - SHOULD TAKE ABOUT 10 INSTRUCTIONS
	mov R12, R5 		; pointer array to r5
	mov R13, R6 		; r13 size move to r6
	mov @R5+, R12		;R12 is the min in the array to compare
						;later in the loop
	call #loop
	ret					; return value store in R12

loop:
	mov @R5+, R7		;moving the pointer again move the new int to r7
						;to compare in the loop
	dec R6				;count dec of the size of the array r5
	jz done				; store the value in R12 to return to q5

	cmp R12, R7			;compare min until found one even smaller than min
	jge loop
	mov R7, R12      	;change pos the min found int the array
	jmp loop


done:
	ret					; store the value in R12 to return to q5

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
