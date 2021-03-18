; Given a positive number, write ALP for verifying whether it is an Armstrong number or not, and display the
; result as the output.

%include "utils_fun.asm"
section .data
    msg     db      'Given number: ', 0h
	msg1    db      'Sum after pass is: ', 0h
    arm     db      'The given number is an Armstrong number', 0h
    n_arm   db      'The given number is not an Armstrong number', 0h
	num     dd      54748    ; Input variable
    rslt    dd      0       ; Variable to store the calculated sum  

section .text
	global _start

_start: 
    call    newline
    mov     eax, msg
    call    print_str

    mov     eax, [num]      ; Move num to eax
    call    print_int_lf
    mov     ecx, 0          ; Initialise ecx to 0
    xor     edx, edx        ; Set edx to 0

    call    newline
    call    intLen          ; Function call to find the length of the number
    ;mov     eax, ecx        
    ;call    print_int_lf

    mov     eax, [num]
    call    num_build       ; Build the armstrong sum of given number
    mov     eax, [num]      ; Move the number to eax 
    cmp     eax, [rslt]     ; Compare eax with rslt
    je      Armstrong       ; Goto Armstrong
    jne     Not_Armstrong   ; Goto Not_Armstrong
    
    
    call    exit_prog       ; Exit the program

intLen:
    inc     ecx             ; count each byte to print - number of characters
    mov     edx, 0          ; empty edx
    mov     esi, 10         ; mov 10 into esi
    idiv    esi             ; divide eax by esi
    add     edx, 48         ; convert edx to it's ascii representation - edx holds the remainder after a divide instruction
    cmp     eax, 0          ; can the integer be divided anymore?
    jnz     intLen          ; jump if not zero to the label divideLoop
    ret

num_build:
    mov     edx, 0          ; empty edx
    mov     esi, 10         ; mov 10 into esi
    idiv    esi             ; divide eax by esi
    
    push    eax             ; eax has the quotient but we don't want to loose its value
    push    ecx             ; ecx has length of the integer 
    
    mov     eax, 1          ; eax will store the final value and needs to be initialised
    call    pow_sum         ; Function call to calculate edx^ecx
    
    pop     ecx             ; restore ecx from the value we pushed onto the stack before function call 
    pop     eax             ; restore eax from the value we pushed onto the stack before function call 
    
    cmp     eax, 0          ; can the integer be divided anymore?
    jnz     num_build       ; jump if not zero to the label num_build
    ret
pow_sum:           ; Function to calcaluate edx^ecx
    dec     ecx             ; Loop Variable

    push    edx             ; To ensure edx is not reset to 0 after multiplying 
    mul     edx             ; Multiply edx with eax
    pop     edx             ; restore edx from the value we pushed onto the stack

    cmp     ecx, 0          ; loop condition
    jnz     pow_sum         ; goto label pow_sum


    mov     ecx, [rslt]     ; mov rslt value to ecx
    add     eax, ecx        ; add eax and ecx
    mov     [rslt], eax     ; Store the sum in Result
    mov     eax, msg1       
    call    print_str
    mov     eax, [rslt]     ; Move result value into eax for printing
    call    print_int_lf
    
    ret

Armstrong:
    mov     eax, arm
    call    print_str_lf
    call    newline
    call    exit_prog
    ret

Not_Armstrong:
    mov     eax, n_arm
    call    print_str_lf
    call    newline
    call    exit_prog
    ret