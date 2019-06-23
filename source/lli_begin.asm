;
; Created by Mateusz Stompór on 21/06/2019.
;

%include "source/iterator.asm"
%include "source/memory_management.asm"

global LLI_BEGIN
section .text

LLI_BEGIN:
    mov rcx, [rsi]
    mov [rdi], rcx
    add rdi, 8
    mov qword [rdi], 0
    ret
