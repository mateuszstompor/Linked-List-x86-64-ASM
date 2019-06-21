%ifndef FUNCTIONS
%define FUNCTIONS
    %ifdef APPLE
      %define LL_ALLOC    _ll_alloc
      %define LL_RELEASE  _ll_release
    %else
      %define LL_ALLOC    ll_alloc
      %define LL_RELEASE  ll_release
    %endif
%endif
