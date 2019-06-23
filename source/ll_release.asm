;
; Created by Mateusz Stompór on 20/06/2019.
;

%include "source/list.asm"
%include "source/memory_management.asm"

global LL_RELEASE
section .text

LL_RELEASE:
    ; address sits in rdi register
    sub rsp, 8
    mov rdi, 32
    call ll_mem_release
    add rsp, 8
    ret
