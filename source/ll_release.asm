;
; Created by Mateusz Stompór on 20/06/2019.
;

%include "source/list.asm"
%include "source/sizes.asm"
%include "source/offsets.asm"
%include "source/memory_management.asm"


global LL_RELEASE
section .text

LL_RELEASE:
    ; address sits in rdi register
    sub rsp, 8
    mov r9, rdi
    mov rcx, [rdi]

    deallocate_nodes:
      cmp rcx, 0
      je deallocate_list
      mov rdx, rcx
      add rdx, LL_NODE_NEXT_OFFSET

      mov rdi, rdx
      mov rsi, LL_NODE_SIZE
      call ll_mem_release

      mov rdx, [rdx]
      mov rcx, rdx
      jmp deallocate_nodes
    deallocate_list:

    mov rdi, r9
    mov rsi, LL_LIST_SIZE
    call ll_mem_release
    add rsp, 8
    ret
