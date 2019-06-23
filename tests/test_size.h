//
// Created by Mateusz Stompór on 21/06/2019.
//

#pragma once

#include <gtest/gtest.h>
#include <linked_list.h>

#include "helpers.h"


class SizeTestFixture : public ::testing::Test {
protected:
    virtual void SetUp() {
        list = ll_alloc(&compare);
        it = lli_alloc();
    }
    virtual void TearDown() {
        ll_release(list);
        lli_release(it);
    }
    linked_list * list;
    iterator * it;
};

TEST_F(SizeTestFixture, EmptyListSize) {
    ASSERT_EQ(ll_size(list), 0);
}

TEST_F(SizeTestFixture, OneElementListSize) {
    lli_begin(it, list);
    int value = 3;
    ll_insert(list, it, (void *)&value);

    ASSERT_EQ(ll_size(list), 1);
}

TEST_F(SizeTestFixture, TwoElementListSize) {
    lli_begin(it, list);
    int value = 3;
    ll_insert(list, it, (void *)&value);
    lli_begin(it, list);
    ll_insert(list, it, (void *)&value);

    ASSERT_EQ(ll_size(list), 2);
}
