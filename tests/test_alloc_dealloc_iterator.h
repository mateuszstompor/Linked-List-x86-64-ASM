//
// Created by Mateusz Stompór on 21/06/2019.
//

#pragma once

#include <gtest/gtest.h>
#include <linked_list.h>

TEST(AllocIteratorTest, AllocAndRelease) {
    iterator * it = NULL;
    ASSERT_EQ(it, (void *)NULL);
    it = lli_alloc();
    ASSERT_NE(it, (void *)NULL);
    lli_release(it);
}
