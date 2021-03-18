; Given a string, write ALP for counting number of words, characters (including spaces), vowels, consonants,
; and display the result as the output.

%include "utils_fun.asm"
section .data
    msg     db "Enter a string (max length 255): ",0h
    msg1    db "Number of Words = ", 0h
    msg2    db "Number of Characters = ", 0h
    msg3    db "Number of Vowels = ", 0h
    msg4    db "Number of Consonants = ", 0h
    
    words   dd 0
    chara   dd 0
    vow     dd 0
    conso   dd 0

    dat db "my namE is Dheeraj", 0h

SECTION .bss
    data: resb    255                                 ; reserve a 255 byte space in memory for the users input string

section .text
    global _start

_start:

    call    newline
    mov     eax, msg
    call    print_str

    mov     edx, 255        ; number of bytes to read
    mov     ecx, data       ; reserved space to store our input (known as a buffer)
    mov     ebx, 0          ; write to the STDIN file
    mov     eax, 3          ; invoke SYS_READ (kernel opcode 3)
    int     80h

    mov     eax, data
    call    str_len
    dec     eax             ; There is an extra neline character in the input stream
    mov     [chara], eax
    mov     ecx, eax
    ; mov     eax, [chara]
    ; call    print_int_lf
    mov     ebx, 0       ;vowel counter
    mov     edx, 0       ;word counter
    mov     esi, 0

    jmp     finding

space_increment:
    inc     edx
    dec     ecx
    inc     esi         ; Address Pointer

finding:

    mov     al,[data+esi]

    cmp     eax, ' '
    je  space_increment

    vowels:
        cmp     al, 'a'
        je      vowel

        cmp     al, 'e'
        je      vowel

        cmp     al, 'i'
        je      vowel

        cmp     al, 'o'
        je      vowel

        cmp     al, 'u'
        je      vowel

        cmp     al, 'A'
        je      vowel

        cmp     al, 'E'
        je      vowel

        cmp     al, 'I'
        je      vowel

        cmp     al, 'O'
        je      vowel

        cmp     al, 'U'
        je      vowel

        jmp     consonant

        vowel:
            inc     ebx
            ; mov     eax, ebx
            ; call    print_int_lf

        consonant:
            inc esi

    loop finding        ; ecx is the loop variable

; Final Calculations
    ; Storing number of words in [words]
    inc     edx
    mov     eax, edx
    mov     [words], edx

    ; Storing number of vowels in [vow]
    mov     eax, ebx
    mov     [vow], ebx

    ; Calculating number of consonants
    mov     eax, [chara]
    sub     eax, ebx
    sub     eax, edx
    inc     eax
    mov     [conso], eax

    mov     eax, msg1
    call    print_str

    mov     eax, [words]
    call    print_int_lf
    
    mov     eax, msg2
    call    print_str

    mov     eax, [chara]
    call    print_int_lf
    int     0x80


    mov     eax, msg3
    call    print_str

    mov     eax, [vow]
    call    print_int_lf


    mov     eax, msg4
    call    print_str

    mov     eax, [conso]
    call    print_int_lf
    
    call    newline
    call    exit_prog


