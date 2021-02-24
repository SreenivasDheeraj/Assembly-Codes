%include        'utils_fun.asm'
 
SECTION .text
global  _start
 
_start:
 
    mov     eax, 919        ; move our first number into eax
    inc     eax             ; add 1 to eax i.e. Increment eax
    call    print_int       ; call our integer print with linefeed function   
    call    newline
    
    call    exit