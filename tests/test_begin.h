//
// Created by Mateusz Stompór on 23/06/2019.
//

#pragma once

#include <gtest/gtest.h>
#include <linked_list.h>

#include "helpers.h"


TEST(ListBeginTest, IteratorStructure) {
    linked_list * list = ll_alloc(&compare);
    iterator * it = lli_alloc();
    lli_begin(it, list);
    ASSERT_EQ(((ll_iterator *)it)->current, (void *)NULL);
    ASSERT_EQ(((ll_iterator *)it)->previous, (void *)NULL);
    lli_release(it);
    ll_release(list);
}
