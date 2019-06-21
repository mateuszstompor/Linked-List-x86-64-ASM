%ifndef SYSCALLS
%define SYSCALLS
    %ifdef APPLE
      %define MUNMAP    73
      %define MMAP      197
    %else
      %define MUNMAP    11
      %define MMAP      9
    %endif
%endif
