;
; Created by Mateusz Stompór on 25/06/2019.
;

%include "source/offsets.asm"
%include "source/iterator.asm"
%include "source/constants.asm"
%include "source/memory_management.asm"


global LLI_END
section .text

LLI_END:
    add rsi, LL_LIST_LAST_OFFSET
    mov rcx, [rsi]
    mov qword [rdi], NULL_PTR
    add rdi, 8
    mov [rdi], rcx
    ret
