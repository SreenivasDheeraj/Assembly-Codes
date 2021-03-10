; Choose a positive value 5 ≤ P ≤ 20, write ALP by defining a P-element array containing P random values
; and do the sum of these values in the array and display the result as the output.

%include "utils_fun.asm"
section .data
	global arr
	len     db  6
	msg     db  "Sum of the array is: ", 0h
arr:
	dd 10
	dd 20
	dd 90
	dd 15
	dd 45
	dd 120

section .text
	global _start

_start:
	call 	newline
	mov     eax, msg
    call    print_str

	mov     esi, 6		; array pointer (index )
	xor     eax, eax	; eax will store the sum (initialised to 0)

sum_it:
	mov     ebx,DWORD [arr+esi*4-4]
	add     eax, ebx
	dec     esi
	test    esi, esi
	jnz     sum_it

	call    print_int_lf
	call 	newline
	call    exit_prog   ; exit the program