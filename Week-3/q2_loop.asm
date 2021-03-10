; Q2) Choose a random number 20 ≤ R ≤ 100, write ALP by using loops for printing the numbers (i.e. from 1 to
; R) and display the result as the output.


%include    'utils_fun.asm'

section .data
	num dd 123 
SECTION .text
global  _start
 
_start:
    call    newline
    mov     ecx, 0
 
nextNumber:
    inc     ecx
    mov     eax, ecx
    call    print_int_lf        ; NOTE call our new integer printing function (itoa)
    cmp     ecx, [num]
    jne     nextNumber
    call    newline
    call    exit_prog
