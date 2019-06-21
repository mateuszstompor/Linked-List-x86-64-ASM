;
; Created by Mateusz Stompór on 21/06/2019.
;

%include "source/functions.asm"
%include "source/syscalls.asm"

%define PROT_READ   0x1
%define MAP_PRIVATE 0x2

global LLI_ALLOC
section .text

LLI_ALLOC:
    xor r9, r9                  ; offset = 0 (32*0)
    xor rdi, rdi                ; addr = NULL
    mov rax, MMAP         ; mmap2
    mov rsi, 8            ; len = 8
    mov r8, -1            ; fd = -1
    mov rdx, PROT_READ
    mov rcx, MAP_PRIVATE
    syscall
    ret
