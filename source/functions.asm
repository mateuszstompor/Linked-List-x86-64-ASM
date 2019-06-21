;
; Created by Mateusz Stompór on 20/06/2019.
;

%ifndef LIST_FUNCTIONS
%define LIST_FUNCTIONS
    %ifdef APPLE
      %define LL_ALLOC    _ll_alloc
      %define LL_SIZE     _ll_size
      %define LL_RELEASE  _ll_release
    %else
      %define LL_ALLOC    ll_alloc
      %define LL_SIZE     ll_size
      %define LL_RELEASE  ll_release
    %endif
%endif

%ifndef ITERATOR_FUNCTIONS
%define ITERATOR_FUNCTIONS
    %ifdef APPLE
      %define LLI_ALLOC    _lli_alloc
      %define LLI_RELEASE  _lli_release
    %else
      %define LLI_ALLOC    lli_alloc
      %define LLI_RELEASE  lli_release
    %endif
%endif
