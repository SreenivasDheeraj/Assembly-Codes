%include    'utils_fun.asm'
SECTION .text
    msg1    db  'Quotient: ', 0h   ; 0h - ASCII for null teminator
    msg2    db  'Remainder: ', 0h  ; 0h - ASCII for null teminator
global  _start
 
_start:
    mov     eax, msg1               
    call    print_str               ; Print message 1
    mov     eax, 699                ; move our first number into eax
    mov     ebx, 71                 ; move our second number into ebx     
    div     ebx                     ; divide eax by ebx
    call    print_int               ; call our integer print with linefeed function
    call    newline                 ; print a newline
    mov     eax, msg2               ; mov message 2 into eax
    call    print_str               ; Print message 2
    mov     eax, edx                ; mov edx into eax for printing
    call    print_int_lf            ; Print message 2
    call    newline                 ; Print a newline     
    call    exit                    ; Call exit