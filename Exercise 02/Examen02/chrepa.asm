
	.cdecls C,LIST,"msp430.h" ; Include device header file

	.global chrepa

; chrepa: Replaces characters in string.
; Input: r12 pointer to first character of string
;		r13 letter thah will be replaced
;		r14 new letter
chrepa:
	mov r12, r15	; copy pointer to 1st character
	clr r12 		; r12 will have the # letters replaced
again:
	cmp.b #0, 0(r15) ;	end of string?
	jeq done
	cmp.b r13, 0(r15) ; is current letter need to be replaced?
	jnz next
	mov.b r14, 0(r15) ; replace letter
	inc r12
next:
	inc r15
	jmp again

done:
	ret
zzzzzz
