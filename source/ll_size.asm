;
; Created by Mateusz Stompór on 21/06/2019.
;

%include "source/list.asm"

global LL_SIZE
section .text

LL_SIZE:
    add rdi, 24
    mov rax, [rdi]
    ret
