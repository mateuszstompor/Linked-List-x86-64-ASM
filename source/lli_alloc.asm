;
; Created by Mateusz Stompór on 21/06/2019.
;

%include "source/iterator.asm"
%include "source/syscalls.asm"
%include "source/mmap.asm"

global LLI_ALLOC
section .text

LLI_ALLOC:
    ; align stack
    sub rsp, 8
    ; allocate storage
    mov rax, MMAP
    xor rdi, rdi
    mov rsi, 16
    mov rdx, PROT_READ | PROT_WRITE
    mov r10, MAP_SHARED | MAP_ANONYMOUS
    mov r8, -1
    xor r9, r9
    syscall
    ; initialize
    mov rcx, rax
    mov qword [rcx], 0
    add rcx, 8
    mov qword [rcx], 0
    ; deallocate space
    add rsp, 8
    ret
