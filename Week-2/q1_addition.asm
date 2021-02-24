%include        'utils_fun.asm'
 
SECTION .text
global  _start
 
_start:
 
    mov     eax, 919        ; move our first number into eax
    mov     ebx, 93         ; move our second number into ebx
    add     eax, ebx        ; add ebx to eax
    call    print_int       ; call our integer print with linefeed function   
    call    newline
    
    call    exit