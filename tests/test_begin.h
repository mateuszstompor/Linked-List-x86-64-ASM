//
// Created by Mateusz Stompór on 23/06/2019.
//

#pragma once

#include <gtest/gtest.h>
#include <linked_list.h>

#include "helpers.h"

class ListBeginTestFixture : public ::testing::Test {
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


TEST_F(ListBeginTestFixture, NoElementsInList) {
    lli_begin(it, list);
    ASSERT_EQ(((ll_iterator *)it)->current, (void *)NULL);
    ASSERT_EQ(((ll_iterator *)it)->previous, (void *)NULL);
}


TEST_F(ListBeginTestFixture, ListWithOneElement) {
    lli_begin(it, list);
    int value = 10;
    ll_insert(list, it, (void *)&value);
    lli_begin(it, list);
    ASSERT_NE(((ll_iterator *)it)->current, (void *)NULL);
    ASSERT_EQ(((ll_iterator *)it)->current->next, (void *)NULL);
    ASSERT_EQ(((ll_iterator *)it)->current->value, (void *)&value);
    ASSERT_EQ(((ll_iterator *)it)->previous, (void *)NULL);
}
