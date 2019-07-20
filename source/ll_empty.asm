;
; Created by Mateusz Stompór on 30/06/2019.
;

%include "source/list.asm"
%include "source/offsets.asm"
%include "source/constants.asm"

global LL_EMPTY
section .text

LL_EMPTY:
    add rdi, LL_LIST_SIZE_OFFSET
    mov rdi, [rdi]
    mov rax, 1
    cmp rdi, NULL_PTR
    je finish
    xor rax, rax
    finish:
    ret
