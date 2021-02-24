%include        'utils_fun.asm'
 
SECTION .text
global  _start
 
_start:
 
    mov     eax, 919        ; move our first number into eax
    dec     eax             ; Decrement eax by 1
    call    print_int       ; call our integer print with linefeed function   
    call    newline
    
    call    exit