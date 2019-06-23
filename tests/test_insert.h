//
// Created by Mateusz Stompór on 23/06/2019.
//

#pragma once

#include <gtest/gtest.h>
#include <linked_list.h>

#include "helpers.h"


TEST(ListInsertTest, EmptyListInsertion) {
    linked_list * list = ll_alloc(&compare);
    iterator * it = lli_alloc();
    lli_begin(it, list);
    int val = 1;
    ll_insert(list, it, (void *)&val);

    uint64_t head = *(uint64_t*)list;
    uint64_t last = *((uint64_t*)list+1);
    uint64_t size = *((uint64_t*)list+3);

    ASSERT_EQ(head, last);
    ASSERT_NE(head, (uint64_t)NULL);
    ASSERT_EQ(size, 1);

    lli_release(it);
    ll_release(list);
}
