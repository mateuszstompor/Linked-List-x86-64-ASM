;
; Created by Mateusz Stompór on 30/06/2019.
;

%include "source/iterator.asm"
%include "source/offsets.asm"


global LLI_EQUAL
section .text

LLI_EQUAL:
    ; About
    ; Compares two iterators against each other
    ; Takes
    ; rdi - pointer to the first iterator
    ; rsi - pointer to the second iterator

    mov rax, 1
    xor rdx, rdx
    mov rcx, [rdi]
    cmp rcx, [rsi]
    cmovne rax, rdx
    mov rcx, [rdi + LL_NODE_CURRENT_OFFSET]
    cmp rcx, [rsi + LL_NODE_CURRENT_OFFSET]
    cmovne rax, rdx
    ret
