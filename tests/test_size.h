//
// Created by Mateusz Stompór on 21/06/2019.
//

#pragma once

#include <gtest/gtest.h>
#include <linked_list.h>

#include "helpers.h"

TEST(SizeTest, EmptyListSize) {
    linked_list * list = NULL;
    list = ll_alloc(&compare);
    ASSERT_EQ(ll_size(list), 0);
    ll_release(list);
}
