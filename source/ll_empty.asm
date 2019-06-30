;
; Created by Mateusz Stompór on 30/06/2019.
;

%include "source/list.asm"
%include "source/offsets.asm"

global LL_EMPTY
section .text

LL_EMPTY:
    add rdi, LL_LIST_SIZE_OFFSET
    mov rdi, [rdi]
    mov rax, 1
    cmp rdi, 0
    je finish
    xor rax, rax
    finish:
    ret
