//
// Created by Mateusz Stompór on 21/06/2019.
//

#pragma once

#include <gtest/gtest.h>
#include <linked_list.h>

#include "helpers.h"

TEST(SizeTest, EmptyListSize) {
    linked_list * list = ll_alloc(&compare);
    ASSERT_EQ(ll_size(list), 0);
    ll_release(list);
}

TEST(SizeTest, OneElementListSize) {
    linked_list * list = ll_alloc(&compare);
    iterator * it = lli_alloc();
    lli_begin(it, list);
    int value = 3;
    ll_insert(list, it, (void *)&value);

    ASSERT_EQ(ll_size(list), 1);

    lli_release(it);
    ll_release(list);
}
