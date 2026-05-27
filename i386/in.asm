segment .data
    LF equ 0xA ; LINE FEED
    NULL equ 0x0
    SYS_CALL equ 0x80
    ; EAX
    SYS_EXIT equ 0x1
    SYS_READ equ 0x3
    SYS_WRITE equ 0X4
    ; EBX
    RET_EXIT equ 0x0
    STD_IN equ 0x0
    STD_OUT equ 0X1

section .data
    msg db 'Qual é o seu nome?', LF
    tam equ $- msg
    gre db 'Oi! '
    tan equ $- gre

section .bss
    nome resb 0xFF
    
section .text

global _start

_start:
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, msg
    mov edx, tam
    int SYS_CALL
    
    mov eax, SYS_READ
    mov ebx, STD_IN
    mov ecx, nome
    mov edx, 0xFF
    int SYS_CALL
    
    mov esi, eax
    
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, gre
    mov edx, tan
    int SYS_CALL
    
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, nome
    mov edx, esi
    int SYS_CALL
    
    mov eax, SYS_EXIT
    mov ebx, RET_EXIT
    int SYS_CALL
