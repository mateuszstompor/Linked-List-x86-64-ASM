;
; Created by Mateusz Stompór on 24/06/2019.
;

%ifndef LL_OFFSETS
%define LL_OFFSETS
    ; List
    %define LL_LIST_HEAD_OFFSET             0
    %define LL_LIST_LAST_OFFSET             8
    %define LL_LIST_COMPARE_OFFSET          16
    %define LL_LIST_SIZE_OFFSET             24
    ; Node
    %define LL_NODE_VALUE_OFFSET            0
    %define LL_NODE_CURRENT_OFFSET          8
    ; Iterator
    %define LL_ITERATOR_CURRENT_OFFSET      0
    %define LL_ITERATOR_PREVIOUS_OFFSET     8
%endif
