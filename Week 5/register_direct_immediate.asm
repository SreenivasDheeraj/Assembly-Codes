# Register Addressing mode + Direct Addressing Mode + Immediate Addressing Mode
%include "utils_fun.asm"
section .data
    num1    dd  3
    num2    dd  5
    msg1    db  "Sum is: ",0h

section .text
    global _start

_start:

    call    newline
    mov     eax, [num1]
    mov     ebx, 20     ;   immediate addressing mode      
    add     eax, ebx    ;   accessing registers directly
    mov     [num1], eax ;   direct addressing mode
    mov     eax, msg1
    call    print_str
    mov     eax, [num1]
    call    print_int_lf
    call    newline
    call    exit_prog