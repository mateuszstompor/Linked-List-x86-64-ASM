//
// Created by Mateusz Stompór on 30/06/2019.
//

#pragma once

#include <gtest/gtest.h>
#include <linked_list.h>

#include "helpers.h"


class EmptinessTestFixture : public ::testing::Test {
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
    int value = 10;
};

TEST_F(EmptinessTestFixture, EmptyListEmptiness) {
    ASSERT_EQ(ll_empty(list), true);
}

TEST_F(EmptinessTestFixture, OneElementListEmptiness) {
    lli_begin(it, list);
    ll_insert(list, it, (void *)&value);
    ASSERT_EQ(ll_empty(list), false);
}

TEST_F(EmptinessTestFixture, TwoElementListEmptiness) {
    lli_begin(it, list);
    ll_insert(list, it, (void *)&value);
    lli_begin(it, list);
    ll_insert(list, it, (void *)&value);
    ASSERT_EQ(ll_empty(list), false);
}
