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
    ll_list * l = (ll_list *)list;
    ASSERT_EQ(l->head, (void *)NULL);
    ASSERT_EQ(l->last, (void *)NULL);
    ASSERT_EQ(l->compare_function, &compare);
    ASSERT_EQ(l->size, 0);
    ll_release(list);
}
