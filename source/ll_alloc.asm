;
; Created by Mateusz Stompór on 20/06/2019.
;

%include "source/functions.asm"
%include "source/syscalls.asm"

%define PROT_READ   0x1
%define MAP_PRIVATE 0x2

global LL_ALLOC
section .text

LL_ALLOC:
    xor r9, r9                  ; offset = 0 (32*0)
    xor rdi, rdi                ; addr = NULL
    mov rax, MMAP         ; mmap2
    mov rsi, 32           ; len = 32
    mov r8, -1            ; fd = -1
    mov rdx, PROT_READ
    mov rcx, MAP_PRIVATE
    syscall
    ret
