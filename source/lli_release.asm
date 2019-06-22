;
; Created by Mateusz Stompór on 21/06/2019.
;

%include "source/iterator.asm"
%include "source/syscalls.asm"

global LLI_RELEASE
section .text

LLI_RELEASE:
  ; address sits in rdi register
  mov rax, MUNMAP
  mov rsi, 8
  syscall
  ret
