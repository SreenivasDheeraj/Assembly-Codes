%include        'utils_fun.asm'
 
SECTION .text

global  _start
 
_start:
    
    call    newline
    mov     eax, 919        ; move our first number into eax
    mov     ebx, 93         ; move our second number into ebx
    sub     eax, ebx        ; subtract ebx from eax
    call    print_int       ; call our integer print with linefeed function   
    call    newline
    call    newline
    
    call    exit