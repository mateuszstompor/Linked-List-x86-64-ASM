//
// Created by Mateusz Stompór on 21/06/2019.
//

#pragma once

#include <gtest/gtest.h>
#include <linked_list.h>

#include "helpers.h"

TEST(AllocIteratorTest, AllocAndRelease) {
    iterator * it = NULL;
    ASSERT_EQ(it, (void *)NULL);
    it = lli_alloc();
    ASSERT_NE(it, (void *)NULL);
    lli_release(it);
}

TEST(AllocIteratorTest, InitialStructure) {
    iterator * it = lli_alloc();
    ASSERT_EQ(((ll_iterator *)it)->current, (void *)NULL);
    ASSERT_EQ(((ll_iterator *)it)->previous, (void *)NULL);
    lli_release(it);
}
