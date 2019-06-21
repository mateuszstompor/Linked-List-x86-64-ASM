;
; Created by Mateusz Stompór on 21/06/2019.
;

%ifndef SYS_CALLS
%define SYS_CALLS
    %ifdef APPLE
      %define MUNMAP    73
      %define MMAP      197
    %else
      %define MUNMAP    11
      %define MMAP      9
    %endif
%endif
