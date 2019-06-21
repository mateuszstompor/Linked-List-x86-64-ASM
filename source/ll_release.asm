%include "source/functions.asm"
%include "source/syscalls.asm"

global LL_RELEASE
section .text

LL_RELEASE:
  ; address sits in rax register
  mov dword rax, MUNMAP ; munmap
  mov dword rsi, 4096   ; len = 4096
  syscall
  ret
