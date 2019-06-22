;
; Created by Mateusz Stompór on 20/06/2019.
;

%ifndef LL_LIST_DECLARATIONS
%define LL_LIST_DECLARATIONS
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


