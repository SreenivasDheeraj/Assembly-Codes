# Direct Offset Addressing Mode + Indirect Addressing Mode + Register Indirect Addressing Mode
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
    MOV     ebx, table      ; Indirect addressing Mode
    mov     eax, msg1
    call    print_str
    mov     eax, [ebx]      ; Register Indirect
    add     eax, [ebx + 8]  ; Direct Offset + Register Indirect
    call    print_int_lf
    call    newline
    call    exit_prog