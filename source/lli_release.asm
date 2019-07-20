;
; Created by Mateusz Stompór on 21/06/2019.
;

%include "source/sizes.asm"
%include "source/iterator.asm"
%include "source/memory_management.asm"

global LLI_RELEASE
section .text

LLI_RELEASE:
    ; address sits in rdi register
    sub rsp, 8
    mov rsi, LL_ITERATOR_SIZE
    call ll_mem_release
    add rsp, 8
    ret
