;
; Created by Mateusz Stompór on 25/06/2019.
;

%include "source/iterator.asm"

global LLI_DEREFERENCE
section .text

LLI_DEREFERENCE:
    mov rax, [rdi]
    mov rax, [rax]
    ret
