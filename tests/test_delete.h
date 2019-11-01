//
// Created by Mateusz Stompór on 23/06/2019.
//

#pragma once

#include <gtest/gtest.h>
#include <linked_list.h>

#include "helpers.h"


class DeleteTestFixture : public ::testing::Test {
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



TEST_F(DeleteTestFixture, EmptyListDeletion) { ;
    lli_begin(it, list);
    ASSERT_EQ(ll_delete(list, it), (void *)NULL);
    ll_list * l = (ll_list *)list;
    ASSERT_EQ(l->head, l->last);
    ASSERT_EQ(l->head, (ll_node *)NULL);
    ASSERT_EQ(l->size, 0);
}

TEST_F(DeleteTestFixture, OneNodeListDeletion) { ;
    int val = 1;
    lli_begin(it, list);
    ll_insert(list, it, (void *)&val);
    lli_begin(it, list);
    ASSERT_EQ(ll_delete(list, it), &val);
    lli_begin(it, list);
    ll_list * l = (ll_list *)list;
    ASSERT_EQ(l->head, l->last);
    ASSERT_EQ(l->head, (ll_node *)NULL);
    ASSERT_EQ(l->size, 0);
}

TEST_F(DeleteTestFixture, MultipleNodesListDeletion) { ;
    int val_a = 1;
    int val_b = 2;
    lli_begin(it, list);
    ll_insert(list, it, (void *)&val_b);
    lli_begin(it, list);
    ll_insert(list, it, (void *)&val_a);
    lli_begin(it, list);
    ASSERT_EQ(ll_delete(list, it), &val_a);
    lli_begin(it, list);
    ll_list * l = (ll_list *)list;
    ASSERT_EQ(l->head, l->last);
    ASSERT_EQ(l->size, 1);
    ASSERT_EQ(ll_delete(list, it), &val_b);
    ASSERT_EQ(l->head, l->last);
    ASSERT_EQ(l->head, (ll_node *)NULL);
    ASSERT_EQ(l->size, 0);
}
