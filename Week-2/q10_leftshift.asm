%include        'utils_fun.asm'
 
SECTION .text
global  _start
 
_start:
 
    mov     eax, 919        ; move our first number into eax
    shl     eax, 3          ; left shift bits of eax by 3 places
    call    print_int       ; call our integer print with linefeed function   
    call    newline
    
    call    exit