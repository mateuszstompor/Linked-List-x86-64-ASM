//
// Created by Mateusz Stompór on 20/06/2019.
//

#pragma once

#include <stddef.h>
#include <inttypes.h>

typedef void T;
typedef void iterator;
typedef void linked_list;
typedef int (* compare_function)(void *, void *);

extern "C" linked_list *  ll_alloc          (compare_function);
extern "C" void           ll_release        (linked_list *);
extern "C" uint64_t       ll_size           (linked_list *);
extern "C" bool           ll_empty          (linked_list *);
extern "C" void           ll_insert         (linked_list *, iterator *, T *);

extern "C" iterator *     lli_alloc         ();
extern "C" void           lli_release       (iterator *);
extern "C" T *            lli_dereference   (iterator *);
extern "C" void           lli_begin         (iterator *, linked_list *);
extern "C" void           lli_end           (iterator *, linked_list *);
extern "C" void           lli_iterate       (iterator *);
extern "C" bool           lli_equal         (iterator *, iterator *);
