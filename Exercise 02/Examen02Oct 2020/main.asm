;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
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

            .global frase, a, b

vdot .macro a, b, c
    mov #0, r13
    mov #3, r7                   ;n <- #3
	mov #a, r4                  ;r4 <- direccion de a
	mov #b, r5                  ;r5 <- direccion de b
	mov #0, r8
	mov #0, r9

$0:
	mov @r5+, r8
	mov @r4+, r9
	mov r9, r6


$1:
    dec r8
    jz $2
    add r6, r9
    jmp $1

$2:
	add r9, c
	dec r7
	jnz $0

	.endm

;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer


;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
; Write the information about the team members:
; 	Name 1: Miguel Villalobos San Miguel
; 	Student number 1: 802-17-4689
;	Section: 036
; 	Name 2: René Torres Cappiello
; 	Student number 2: 843-14-8626
;	Section: 036
; 	Name 3: Isaac L Rodriguez Pacheco
; 	Student number 3: 843-15-7462
;	Section: 096
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
; Problem 1
;-------------------------------------------------------------------------------

	push #frase		; Insert here the 'push' instructions
					; needed to pass parameters to the subroutine in the stack.

					; Now call the subroutine

	call #numadd 	; call the subroutines

	jmp $      		 ; result should be in register R12 and be equal to 8 for test string
	nop				 ; test with at least 3 different test strings because I will modify the string
					 ; to confirm that your code works.

;-------------------------------------------------------------------------------
; Problem 2
;-------------------------------------------------------------------------------
    				; call macro 'vdot' as appropiate

					; Solution
	vdot a, b, r13

					; r13 should be 1195 for the example vectors provided;
					; Test with at least 3 sets of values; I will modify 'a' and 'b' when grading
					; to confirm that your code works.

					; End of solution
	jmp $
	nop



numadd:
	pop r10
	pop r14
	mov #0, r11
	call #ato
	jmp $
	nop
ato:
	clr r13
	mov.b @r14, r13
	cmp.b #0x00, r13
	jeq done
	mov r13, r12
	inc r14
	bic.b #0x0F, r13
	cmp.b #0x30, r13
	jeq sum
	jmp ato
sum:
	bic.b #0xF0, r12
	add r12, r11
	jmp ato


done:
	mov r11, r12
	push r10
	ret


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
            
