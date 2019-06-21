;
; Created by Mateusz Stompór on 20/06/2019.
;

%include "source/functions.asm"
%include "source/syscalls.asm"

global LL_RELEASE
section .text

LL_RELEASE:
  ; address sits in rdi register
  mov rax, MUNMAP ; munmap
  mov rsi, 32     ; len = 32
  syscall
  ret
