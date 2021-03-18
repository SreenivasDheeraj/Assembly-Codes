; Given a positive number, write ALP for verifying whether it is a prime number or not, and display the result
; as the output.

%include "utils_fun.asm"
section .data
    msg     db      'Given number: ', 0h
	msg1    db      'The given number is prime ', 0h
    msg2    db      'The given number is non-prime ', 0h
	num     dd      10235   

section .bss
num_input:  resb    5
section .text
	global _start

_start: 

    call    newline
    mov     eax, msg
    call    print_str    
    
    mov     eax, [num]
    call    print_int_lf
    mov     ebx, 2
    div     ebx
    mov     ecx, eax            ; We will check for divisors from num//2 to 2
    call    newline
    call    prime_check
    call    exit_prog

prime_check:   
    xor     edx, edx            ; prevent Floating Point Exception Error
    mov     eax, [num]          ; reset eax to num
    div     ecx                 ; divide by num
    dec     ecx                 ; divide ecx (loop variable)
    
    mov     ebx, 0              
    cmp     edx, ebx            ; check if a remainder is 0
    je      non_prime           ; Break the loop and print the number is non-prime 
    
    mov     ebx, 1              
    cmp     ecx, ebx            ; Check if the loop ends
    je      prime               ; This means the number is prime

    mov     eax, [num]
    cmp     eax, [num]
    je      prime_check         ; loop continuatuion - loop continues until it breaks
	
prime:
    mov     eax, msg1
    call    print_str_lf
    call    newline
    call    exit_prog
non_prime:
    mov     eax, msg2
    call    print_str_lf
    call    newline
    call    exit_prog