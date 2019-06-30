//
// Created by Mateusz Stompór on 30/06/2019.
//

#pragma once

#include <gtest/gtest.h>
#include <linked_list.h>

#include "helpers.h"


class IteratorEqualTestFixture : public ::testing::Test {
protected:
    virtual void SetUp() {
        list = ll_alloc(&compare);
        it_a = lli_alloc();
        it_b = lli_alloc();
    }
    virtual void TearDown() {
        ll_release(list);
        lli_release(it_a);
        lli_release(it_b);
    }
    linked_list * list;
    iterator * it_a;
    iterator * it_b;
    int value = 10;
};

TEST_F(IteratorEqualTestFixture, TheSameIterator) {
    lli_begin(it_a, list);
    ASSERT_TRUE(lli_equal(it_a, it_a));
}

TEST_F(IteratorEqualTestFixture, DifferentIteratorSameDataStructure) {
  lli_begin(it_a, list);
  lli_begin(it_b, list);
  ASSERT_TRUE(lli_equal(it_a, it_b));
}

TEST_F(IteratorEqualTestFixture, DifferentIteratorAndDataStructure) {
    lli_begin(it_a, list);
    ll_insert(list, it_a, (void *)&value);
    lli_begin(it_a, list);
    ll_iterator * i  = (ll_iterator * )it_a;
    ll_list * l  = (ll_list * )list;
    lli_iterate(it_a);
    lli_begin(it_b, list);
    ASSERT_FALSE(lli_equal(it_a, it_b));
}
