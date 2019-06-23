;
; Created by Mateusz Stompór on 23/06/2019.
;


%include "source/list.asm"
%include "source/memory_management.asm"

global LL_INSERT
section .text

LL_INSERT:
    ; About
    ; Inserts a new node to the list
    ; Takes
    ; rdi - pointer to a list
    ; rsi - pointer to an iterator
    ; rdx - pointer to a value

    ; allocate storage for a node
    push rdi
    push rsi
    push rdx
    mov rdi, 16
    call ll_mem_allocate
    pop rdx
    pop rsi
    pop rdi

    ; set new node properties
    mov rcx, rax
    ; set value which the node keeps
    mov [rcx], rdx
    add rcx, 8
    mov rdx, [rsi]
    ; set next node of newly created node
    mov [rcx], rdx

    ; assign head
    mov [rdi], rax
    add rdi, 8
    ; assign last
    mov [rdi], rax
    add rdi, 16
    ; increase size
    add qword [rdi], 1
    ret
