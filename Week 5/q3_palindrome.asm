; Given a positive number, write ALP for verifying whether it is a palindrome number or not, and display the
; result as the output.

SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

%include "utils_fun.asm"
section .data
    msg     db      'Given number: ', 0h
	msg1    db      'Reverse num after pass is: ', 0h
    pal     db      'The given number is a Palindrome', 0h
    n_pal   db      'The given number is not a Palindrome', 0h
	num     dd      54745    ; Input variable
    rslt    dd      0       ; Variable to store the calculated sum  

segment .bss
   num1 resb 2
section .text
	global _start

_start: 

    call    newline
    mov     eax, msg
    call    print_str
    
    mov     eax, [num]      ; Move num to eax
    call    print_int_lf
    mov     ebx, [rslt]     ; Move rslt to ebx
    mov     ecx, 10         ; Initialise ecx to 10
    xor     edx, edx        ; Set edx to 0

    call    newline

    call    num_rev         ; Build the armstrong sum of given number
    mov     eax, [rslt]     ; Move rslt to eax 
    cmp     eax, [num]      ; Compare eax with give number
    je      Palindrome      ; Goto Armstrong
    jne     Not_Palindrome  ; Goto Not_Armstrong
    
    call    exit_prog       ; Exit the program

num_rev:
    mov     edx, 0          ; empty edx
    mov     esi, 10         ; mov 10 into esi
    idiv    esi             ; divide eax by esi
    
    push    eax             ; eax has the quotient but we don't want to loose its value
    push    ecx             ; ecx has length of the integer 
    
    call    rev_build       ; Build the reverse of given number step by step  
    ;call    print_int_lf

    pop     ecx             ; restore ecx from the value we pushed onto the stack before function call 
    pop     eax             ; restore eax from the value we pushed onto the stack before function call 
    
    cmp     eax, 0          ; can the integer be divided anymore?
    jnz     num_rev         ; jump if not zero to the label num_build
    
    mov     [rslt], ebx     ; Update result to final reverse number
    ret

rev_build:
    push    edx             ; Store edx so that it's not lost during multiplication
    mov     eax, ebx        ; eax will store the final value and needs to be initialised
    mul     ecx             ; multiply the digit by 10
    pop     edx             ; retirieve edx from the stack
    add     eax, edx        ; add eax, edx
    mov     ebx, eax        ; update ebx to prevent loss of sum
    
    mov     eax, msg1       ; Print pass value
    call    print_str       
    mov     eax, ebx
    call    print_int_lf
    ret
Palindrome:
    mov     eax, pal
    call    print_str_lf
    call    newline
    call    exit_prog
    ret

Not_Palindrome:
    mov     eax, n_pal
    call    print_str_lf
    call    newline
    call    exit_prog
    ret