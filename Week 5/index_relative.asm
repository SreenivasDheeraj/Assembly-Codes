# Indexed Addressing Mode + Relative Addressing Mode
%include "utils_fun.asm"
section .data
    num1    dd  3
    num2    dd  5
    msg1    db  "Sum is: ",0h
    table dq  3, 5, 8, 7
section .text
    global _start

_start:
    call    newline 
    mov     ecx, table
    mov     ebx, 24
    mov     eax, [ecx]          ; Relative Addressing
    add     eax, [ecx + ebx]    ; Indexed Addressing Mode
    call    print_int_lf
    call    newline
    call    exit_prog
