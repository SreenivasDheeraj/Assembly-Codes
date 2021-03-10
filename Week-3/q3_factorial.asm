; Write ALP by using recursion for finding a factorial
; of number between 5 and 30 and display the result

%include "utils_fun.asm"
section .data
	msg1    db  'Factorial of given number is: ', 0h
	num     dd  14

section .bss
	fact resb 4

section .text
	global _start

_start: 
	mov     eax,  msg1
	call    print_str

	mov     ebx, [num]
	call    get_factorial

	call    print_int_lf

	call    exit_prog      ; exit the program


get_factorial:
	cmp     ebx, 1
	jg      recurcall
	mov     eax, 1
	ret

recurcall:
	dec     ebx
	call    get_factorial	; build the stack
	inc     ebx
	mul     ebx
	ret