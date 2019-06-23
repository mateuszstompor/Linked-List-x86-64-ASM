;
; Created by Mateusz Stompór on 23/06/2019.
;

%include "source/mmap.asm"
%include "source/list.asm"
%include "source/syscalls.asm"

global LL_INSERT
section .text

LL_INSERT:
    ; allocate storage for a node
    push rdi
    push rsi
    sub rsp, 8
    mov rax, MMAP
    xor rdi, rdi
    mov rsi, 16
    mov rdx, PROT_READ | PROT_WRITE
    mov r10, MAP_SHARED | MAP_ANONYMOUS
    mov r8, -1
    xor r9, r9
    syscall
    add rsp, 8
    pop rsi
    pop rdi
    mov [rdi], rax
    add rdi, 8
    mov [rdi], rax
    add rdi, 16
    add qword [rdi], 1
    ret
