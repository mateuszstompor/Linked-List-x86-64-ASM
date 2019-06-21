//
// Created by Mateusz Stompór on 20/06/2019.
//

#pragma once

#include <stddef.h>

typedef void linked_list;
typedef void T;
typedef int (* compare_function)(void *, void *);

extern "C" linked_list *  ll_alloc    (compare_function);
extern "C" void           ll_release  (linked_list *);
