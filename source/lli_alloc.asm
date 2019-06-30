;
; Created by Mateusz Stompór on 21/06/2019.
;

%include "source/sizes.asm"
%include "source/iterator.asm"
%include "source/memory_management.asm"

global LLI_ALLOC
section .text

LLI_ALLOC:
    ; align stack
    sub rsp, 8
    ; allocate storage
    mov rdi, LL_ITERATOR_SIZE
    call ll_mem_allocate
    ; initialize
    mov rcx, rax
    xor rsi, rsi
    mov qword [rcx], rsi ; current
    add rcx, 8
    mov qword [rcx], rsi ; previous
    ; deallocate space
    add rsp, 8
    ret
