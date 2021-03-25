section .data
    strResult db '000000'
    rlen equ $ - strResult
    nl db "    "
    len1 equ $ - nl
    table dq  3, 5, 8, 7


section .text
    global _start

_start:

    mov ebx, 8
    mov ecx, table
    mov eax, [ecx]
    
auto_inc:

    add eax, [ecx + ebx]
    add ebx, 8
    cmp ebx, 32
    jne auto_inc

    call display

    mov eax, 1
    int 0x80


display:
    mov ecx, 10
    mov ebx, 0
divide:
    mov edx, 0
    div ecx
    push edx
    inc ebx
    cmp eax, 0
    jnz divide

    mov eax, rlen
    sub eax, ebx
    mov ecx, ebx
    mov esi, eax

reverse:
    pop eax
    add eax, '0'
    mov [strResult+esi], eax
    inc esi
    loop reverse

print:
    mov eax, 4
    mov ebx, 1
    mov ecx, strResult
    mov edx, 6
    int 0x80

    ret
