%ifndef LL_MEMORY_MANAGEMENT
%define LL_MEMORY_MANAGEMENT

%include "source/mmap.asm"
%include "source/syscalls.asm"

ll_mem_allocate:
    ; About
    ; assumes that user aligns stack before call
    ; Takes
    ; rdi - size in bytes
    ; Returns
    ; rax - address
    sub rsp, 8
    mov rax, MMAP
    mov rsi, rdi
    xor rdi, rdi
    mov rdx, PROT_READ | PROT_WRITE
    mov r10, MAP_SHARED | MAP_ANONYMOUS
    mov r8, -1
    xor r9, r9
    syscall
    add rsp, 8
    ret

ll_mem_release:
    ; About
    ; assumes that user aligns stack before call
    ; Takes
    ; rdi - size in bytes
    sub rsp, 8
    mov rax, MUNMAP
    mov rsi, rdi
    syscall
    add rsp, 8
    ret

%endif