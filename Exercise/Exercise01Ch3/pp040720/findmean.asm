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

	.global x,mean

;----------------------------------------------------------------------
; This program calculates the integer mean of the 8 elements in array x
;----------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer


;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------

	push #mean			; push address of 'mean'
	push #x 			; push address of 1st array element
	call #find_mean		; call sub-routine
	jmp $
	nop


find_mean:
	; Find the average of an 8 element array.
	; Store result in variable
    pop r14          	; r14 ← original program PC
    pop r4            	; r4 ← address of first array element
    clr r5				; r5 ← 0
    mov #8,r6           ; r6 ← 8 	(will use as a counter)
find_mean_L1:
    add @r4+, r5       ; r5 ← r5 + (r4) ; r4 ← r4 + 2
    dec r6				; r6 ← r6 - 1
    jge find_mean_L1	; if r6 != 0, repeat; else r5 = sum all elements
    ; divide by 8
    rra r5				; r5 ← r5 / 2
    rra r5				; r5 ← r5 / 2
    rra r5				; r5 ← r5 / 2
    pop r13				; r13 ← address for result
    mov r5, 0(r13)		; (mean) ← r5
    push r14          	; store original program PC on stack
    ; instruction 'ret' will cause
   	;	PC ← (SP)  (address associated with back_from_sub) ; SP ← SP + 2;
    ; Program will continue at address associated with back_from_sub
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
            
