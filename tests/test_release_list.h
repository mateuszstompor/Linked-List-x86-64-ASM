//
// Created by Mateusz Stompór on 22/07/2019.
//

#pragma once

#include <gtest/gtest.h>
#include <linked_list.h>

#include "helpers.h"


class ReleaseTestFixture : public ::testing::Test {
protected:
    int value = 10;
    unsigned long long iterations = 1000000L;
};

TEST_F(ReleaseTestFixture, InsertAndDeallocateEachTime) {
  for (unsigned long long i = 0; i < iterations; ++i) {
    linked_list * list = ll_alloc(&compare);
    iterator * it = lli_alloc();
    lli_begin(it, list);
    ll_insert(list, it, (void *)&value);
    ll_release(list);
    lli_release(it);
  }
}

TEST_F(ReleaseTestFixture, InsertManyTimesAndDeallocateAtOnce) {
  linked_list * list = ll_alloc(&compare);
  iterator * it = lli_alloc();
  for (unsigned long long i = 0; i < iterations; ++i) {
    lli_begin(it, list);
    ll_insert(list, it, (void *)&value);
  }
  ll_release(list);
  lli_release(it);
}
