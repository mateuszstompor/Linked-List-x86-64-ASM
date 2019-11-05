;
; Created by Mateusz Stompór on 01/11/2019.
;


%include "source/list.asm"
%include "source/sizes.asm"
%include "source/memory_management.asm"

global LL_DELETE
section .text

LL_DELETE:
    ; About
    ; Deletes given node from a list
    ; Takes
    ; rdi - pointer to a list
    ; rsi - pointer to an iterator
    
    mov rax, 0
    cmp qword [rsi], 0
    je .finish
    mov r9, [rsi + 8]
    cmp r9, 0
    jne .finish_setting_head
    mov r9, [rdi + 24]
    sub r9, 1
    mov qword [rdi + 24], r9
    mov r9, [rsi]
    mov rax, [r9]
    mov r9, [r9 + 8]
    mov qword [rdi], r9
    .finish_setting_head:
    cmp r9, 0
    jne .finish
    mov qword [rdi + 8], 0
    .finish:
    ret
