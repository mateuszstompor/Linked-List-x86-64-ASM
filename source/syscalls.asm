;
; Created by Mateusz Stompór on 21/06/2019.
;

%ifndef SYS_CALLS
%define SYS_CALLS
    %ifdef APPLE
      %define MUNMAP    0x2000049
      %define MMAP      0x20000c5
    %else
      %define MUNMAP    11
      %define MMAP      9
    %endif
%endif
