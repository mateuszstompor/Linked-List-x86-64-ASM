;
; Created by Mateusz Stompór on 23/06/2019.
;

%ifndef LL_ITERATOR_DECLARATIONS
%define LL_ITERATOR_DECLARATIONS
    %ifdef APPLE
      %define LLI_ALLOC    _lli_alloc
      %define LLI_RELEASE  _lli_release
      %define LLI_BEGIN    _lli_begin
    %else
      %define LLI_ALLOC    lli_alloc
      %define LLI_RELEASE  lli_release
      %define LLI_BEGIN    lli_begin
    %endif
%endif