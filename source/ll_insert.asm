;
; Created by Mateusz Stompór on 23/06/2019.
;


%include "source/list.asm"
%include "source/memory_management.asm"

global LL_INSERT
section .text

LL_INSERT:
    ; allocate storage for a node
    push rdi
    push rsi
    sub rsp, 8
    mov rdi, 16
    call ll_mem_allocate
    add rsp, 8
    pop rsi
    pop rdi
    ; assign head
    mov [rdi], rax
    add rdi, 8
    ; assign last
    mov [rdi], rax
    add rdi, 16
    ; increase size
    add qword [rdi], 1
    ret
