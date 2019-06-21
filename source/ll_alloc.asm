%include "source/functions.asm"
%include "source/syscalls.asm"

%define PROT_READ 0x1
%define MAP_PRIVATE 0x2

global LL_ALLOC
section .text

LL_ALLOC:
    mov dword rax, MMAP         ; mmap2
    xor rdi, rdi                ; addr = NULL
    mov dword rsi, 4096         ; len = 4096
    xor r9, r9                  ; offset = 0 (4096*0)
    mov dword r8, -1            ; fd = -1
    mov dword rdx, PROT_READ
    mov dword rcx, MAP_PRIVATE
    syscall
    ret
