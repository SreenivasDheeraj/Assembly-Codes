%include        'utils_fun.asm'
 
SECTION .text

global  _start
 
_start:
    
    call    newline
    mov     eax, 64         ; move our first number into eax
    mov     ebx, 63         ; move our second number into ebx
    and     eax, ebx        ; logical and of eax, ebx
    call    print_int       ; call our integer print with linefeed function   
    call    newline
    call    newline
    
    call    exit