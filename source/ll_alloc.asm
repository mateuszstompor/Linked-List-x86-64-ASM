;
; Created by Mateusz Stompór on 20/06/2019.
;

%include "source/list.asm"
%include "source/memory_management.asm"
%include "source/sizes.asm"

global LL_ALLOC
section .text

LL_ALLOC:
    ; allocate storage
    push rdi
    mov rdi, LL_LIST_SIZE
    call ll_mem_allocate
    ; initialize
    xor rsi, rsi
    mov rcx, rax
    mov qword [rcx], rsi  ; head
    add rcx, 8
    mov qword [rcx], rsi  ; last
    add rcx, 8
    pop rdi
    mov [rcx], rdi      ; compare func
    add rcx, 8
    mov qword [rcx], rsi  ; size
    ret
