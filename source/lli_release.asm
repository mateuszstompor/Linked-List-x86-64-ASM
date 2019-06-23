;
; Created by Mateusz Stompór on 21/06/2019.
;

%include "source/iterator.asm"
%include "source/memory_management.asm"

global LLI_RELEASE
section .text

LLI_RELEASE:
    ; address sits in rdi register
    sub rsp, 8
    mov rdi, 16
    call ll_mem_release
    add rsp, 8
    ret
