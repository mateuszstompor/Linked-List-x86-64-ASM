%ifdef APPLE
global _insert
%else
global insert
%endif

section .text

%ifdef APPLE
_insert:
    ret
%else
insert:
    ret
%endif