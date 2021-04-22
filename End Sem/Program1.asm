; ALP for finding Greatest Common Divisor (GCD) and Least
; Common Multiple (LCM) of A and B

%include "utils_fun.asm" ; Utily functions file

SECTION .data
    txt1    db  'First number is: ', 0h   ; 0h - ASCII for null teminator
    txt2    db  'Second number is: ', 0h   ; 0h - ASCII for null teminator
    msg1    db  'GCD is: ', 0h   ; 0h - ASCII for null teminator
    msg2    db  'LCM is: ', 0h  ; 0h - ASCII for null teminator
    num1    dd  3
    num2    dd  25
    hcf     dd  0
    lcm     dd  1
section .text
	global _start

_start:

    call    newline
    mov     eax, txt1
    call    print_str
    mov     eax, [num1]
    call    print_int_lf
    call    newline
    mov     eax, txt2
    call    print_str
    mov     eax, [num2]
    call    print_int_lf

    xor     edx, edx
    call    newline
    mov     eax, [num1]
    mov     ebx, [num2]
    cmp     eax, ebx    ; The greater one becomes dividend and is to be stored in eax
    jle     exchange
    jmp     calc_gcd_lcm
    
    call    exit_prog

exchange: ; Function to swap the numbers in eax, ebx
    mov     eax, [num2]
    mov     ebx, [num1]

calc_gcd_lcm:
    xor     edx, edx
    div     ebx             ; eax/ebx
    mov     eax, ebx        ; store quotient in ebx
    mov     ebx, edx        ; Remainder becomes the next divisor
    cmp     ebx, 0          ; We stop long division when remainder is 0
    je      final           ; Exit function
    jmp     calc_gcd_lcm    ; Else we perform division again

final:
    mov     [hcf], eax      ; When the remainder is 0, the previous divisor is the GCD

calc_lcm:
    mov     eax, [num1] 
    mov     ebx, [num2]
    mul     ebx             ; Now we have num1*num2 in eax
    xor     edx, edx
    mov     ebx, [hcf]
    idiv    ebx             ; eax/ebx => num1*num2 / hcf
    mov     [lcm], eax      ; store the lcm

final_output:   ; Function to print final outputs
    mov     eax, msg1
    call    print_str
    mov     eax, [hcf]
    call    print_int_lf    ; Print GCD
    call    newline
    mov     eax, msg2
    call    print_str
    mov     eax, [lcm]
    call    print_int_lf    ; Print LCM
    call    newline
    call    exit_prog
