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
