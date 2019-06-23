//
// Created by Mateusz Stompór on 20/06/2019.
//

#pragma once

#include <gtest/gtest.h>
#include <linked_list.h>

#include "helpers.h"


TEST(ListInitTest, AllocAndRelease) {
    linked_list * list = NULL;
    ASSERT_EQ(list, (void *)NULL);
    list = ll_alloc(&compare);
    ASSERT_NE(list, (void *)NULL);
    ll_release(list);
}

TEST(ListInitTest, TestInitialStructure) {
    linked_list * list = ll_alloc(&compare);
    ASSERT_EQ(*(uint64_t *)list, 0);
    ASSERT_EQ(*(((uint64_t *)list) + 1), 0);
    ASSERT_EQ(*(((uint64_t *)list) + 2), (uint64_t)(&compare));
    ASSERT_EQ(*(((uint64_t *)list) + 3), 0);
    ll_release(list);
}
