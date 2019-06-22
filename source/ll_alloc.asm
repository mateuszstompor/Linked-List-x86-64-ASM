;
; Created by Mateusz Stompór on 20/06/2019.
;

%include "source/mmap.asm"
%include "source/list.asm"
%include "source/syscalls.asm"

global LL_ALLOC
section .text

LL_ALLOC:
    ; allocate storage
    push rdi
    mov rax, MMAP
    xor rdi, rdi
    mov rsi, 32
    mov rdx, PROT_READ | PROT_WRITE
    mov r10, MAP_SHARED | MAP_ANONYMOUS
    mov r8, -1
    xor r9, r9
    syscall
    ; initialize
    mov rcx, rax
    mov qword [rcx], 0  ; head
    add rcx, 8
    mov qword [rcx], 0  ; last
    add rcx, 8
    pop rdi
    mov [rcx], rdi      ; compare func
    add rcx, 8
    mov qword [rcx], 0  ; size
    ret
