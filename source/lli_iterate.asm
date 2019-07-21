;
; Created by Mateusz Stompór on 30/06/2019.
;

%include "source/iterator.asm"
%include "source/offsets.asm"


global LLI_ITERATE
section .text

LLI_ITERATE:
    ; About
    ; Gets a pointer to an iterator. Advances it by one
    ; Takes
    ; rdi - pointer to an iterator

    cmp dword [rdi], 0
    je finish
    mov rax, [rdi]
    mov [rdi + LL_ITERATOR_PREVIOUS_OFFSET], rax
    mov rax, [rax + LL_NODE_NEXT_OFFSET]
    mov [rdi], rax
    finish:
    ret
