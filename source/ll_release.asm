;
; Created by Mateusz Stompór on 20/06/2019.
;

%include "source/list.asm"
%include "source/sizes.asm"
%include "source/offsets.asm"
%include "source/constants.asm"
%include "source/memory_management.asm"


global LL_RELEASE
section .text

LL_RELEASE:
    ; address sits in rdi register
    push rbx
    ; deallocate list
    mov rbx, [rdi]
    mov rsi, LL_LIST_SIZE
    call ll_mem_release
    ; deallocate nodes in the list if exist
    deallocate_nodes:
      cmp rbx, NULL_PTR
      je finish
      mov rdi, rbx
      mov rbx, [rbx + 8]
      mov rsi, LL_NODE_SIZE
      call ll_mem_release
      jmp deallocate_nodes
    finish:
    pop rbx
    ret
