;
; Created by Mateusz Stompór on 23/06/2019.
;

%ifndef MMAP_CONSTANTS
%define MMAP_CONSTANTS
    ; permissions
    %define PROT_READ           0x01
    %define PROT_WRITE          0x02
    ; access
    %ifdef APPLE
      %define MAP_SHARED        0x0001
      %define MAP_ANONYMOUS     0x1000
    %else
      %define MAP_SHARED        0x01
      %define MAP_ANONYMOUS     0x20
    %endif
%endif
