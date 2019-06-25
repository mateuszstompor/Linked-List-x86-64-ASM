;
; Created by Mateusz Stompór on 25/06/2019.
;

%include "source/iterator.asm"
%include "source/memory_management.asm"
%include "source/offsets.asm"


global LLI_END
section .text

LLI_END:
    add rsi, LL_LIST_LAST_OFFSET
    mov rcx, [rsi]
    mov qword [rdi], 0
    add rdi, 8
    mov [rdi], rcx
    ret
