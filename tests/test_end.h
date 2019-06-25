//
// Created by Mateusz Stompór on 25/06/2019.
//

#pragma once

#include <gtest/gtest.h>
#include <linked_list.h>

#include "helpers.h"


class ListEndTestFixture : public ::testing::Test {
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


TEST_F(ListEndTestFixture, EmptyList) {
    lli_end(it, list);
    ll_iterator * i = (ll_iterator *)it;
    ASSERT_EQ(i->previous, (void *)NULL);
    ASSERT_EQ(i->current, (void *)NULL);
}

TEST_F(ListEndTestFixture, OneElementList) {
    lli_end(it, list);
    char value = 'a';
    ll_insert(list, it, (void *)&value);
    lli_end(it, list);
    ll_iterator * i = (ll_iterator *)it;
    ll_list * l = (ll_list *)list;
    ASSERT_EQ(i->previous, (void *)l->head);
    ASSERT_EQ(i->current, (void *)NULL);
}
