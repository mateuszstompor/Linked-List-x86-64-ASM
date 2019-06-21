//
// Created by Mateusz Stompór on 20/06/2019.
//

#pragma once

#include <gtest/gtest.h>
#include <linked_list.h>

#include "helpers.h"


TEST(AllocListTest, AllocAndRelease) {
    linked_list * list = NULL;
    ASSERT_EQ(list, (void *)NULL);
    list = ll_alloc(&compare);
    ASSERT_NE(list, (void *)NULL);
    ll_release(list);
}
