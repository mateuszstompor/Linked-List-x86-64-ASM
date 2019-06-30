//
// Created by Mateusz Stompór on 30/06/2019.
//

#pragma once

#include <gtest/gtest.h>
#include <linked_list.h>

#include "helpers.h"


class IterateTestFixture : public ::testing::Test {
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

TEST_F(IterateTestFixture, EmptyListIterate) {
    lli_begin(it, list);
    ll_iterator * i  = (ll_iterator * )it;
    lli_iterate(it);
    ASSERT_EQ(i->current, (void*)NULL);
    ASSERT_EQ(i->previous, (void*)NULL);
}

TEST_F(IterateTestFixture, OneElementListIterate) {
    lli_begin(it, list);
    ll_insert(list, it, (void *)&value);
    lli_begin(it, list);
    ll_iterator * i  = (ll_iterator * )it;
    ll_list * l  = (ll_list * )list;
    lli_iterate(it);
    ASSERT_EQ(i->current, (void*)NULL);
    ASSERT_EQ(i->previous, l->head);
}
