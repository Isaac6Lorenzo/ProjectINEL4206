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

	.sect ".sysmem"
x .word 34, 12, 23, 45, 12, 43, 2, 18
n .word 8
min .word 0xFFFF ; initialize to largest unsigned 16-bit quantity
max .word 0
z .word 0; count
; This program identifies the smallest and largest element in array x
;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer


;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------
		mov #x, r12		; r12 <- (array x)
		mov n, r14		; r14 <- n
		clr r13			; r13 <- 0
		clr r15			; r15 <- 0
again:
		dec r14			; r14 <- r14 - 1
		jn done			;
		add @r12+,r13	; r13 <- r13 + (r12) ; r12 <- r12 + 2
		jmp again		; repeat if r14 > 0
done:
		mov r13, z		; (z) <- r13
		; z = 189 = 010111101b; 189/8 = 23.625 = 010111.101b

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
            
