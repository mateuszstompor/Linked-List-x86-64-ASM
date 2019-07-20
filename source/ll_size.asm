;
; Created by Mateusz Stompór on 21/06/2019.
;

%include "source/list.asm"
%include "source/offsets.asm"

global LL_SIZE
section .text

LL_SIZE:
    add rdi, LL_LIST_SIZE_OFFSET
    mov rax, [rdi]
    ret
