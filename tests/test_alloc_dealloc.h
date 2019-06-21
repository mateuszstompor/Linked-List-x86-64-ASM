//
// Created by Mateusz Stompór on 20/06/2019.
//

#pragma once

#include <stdlib.h>
#include <gtest/gtest.h>
#include <linked_list.h>

int compare(void * lhs, void * rhs) {
  return 0;
}

TEST(AllocTest, AllocAndRelease) {
    linked_list * list = NULL;
    ASSERT_EQ(list, (void *)NULL);
    list = ll_alloc(&compare);
    ASSERT_NE(list, (void *)NULL);
    ll_release(list);
}
