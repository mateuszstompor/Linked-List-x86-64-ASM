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


    ; set value which the node keeps
    mov [rax], rdx
    mov rdx, [rsi]
    ; set next node of newly created node
    mov [rax + 8], rdx


    xor r8, r8
    mov r9, [rdi]
    iterate_through_list:
        cmp r9, [rsi]
        je add_node

        mov r8, r9
        mov r9, [r9 + 8]
        jmp iterate_through_list

    add_node:
        cmp r8, 0
        jne add_middle
        add_head:
           mov [rdi], rax
           jmp update_last
        add_middle:
           mov [r8 + 8], rax
        update_last:
        cmp dword [rsi], 0
        jne skip_last
        assign_last:
            mov [rdi + 8], rax
        skip_last:
    add qword [rdi + 24], 1
    ret
