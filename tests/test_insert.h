//
// Created by Mateusz Stompór on 23/06/2019.
//

#pragma once

#include <gtest/gtest.h>
#include <linked_list.h>

#include "helpers.h"


class InsertTestFixture : public ::testing::Test {
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



TEST_F(InsertTestFixture, EmptyListInsertion) { ;
    int val = 1;
    lli_begin(it, list);
    ll_insert(list, it, (void *)&val);
    ll_list * l = (ll_list *)list;
    ASSERT_EQ(l->head, l->last);
    ASSERT_NE(l->head, (ll_node *)NULL);
    ASSERT_EQ(l->size, 1);
    ll_node * n = l->head;
    ASSERT_EQ(n->value, &val);
    ASSERT_EQ(n->next, (ll_node *)NULL);
}

TEST_F(InsertTestFixture, OneNodeListInsertionAtTheBeginning) { ;
    int val1 = 1, val2 = 2;
    lli_begin(it, list);
    ll_insert(list, it, (void *)&val1);
    lli_begin(it, list);
    ll_insert(list, it, (void *)&val2);

    ll_list * l = (ll_list *)list;
    ASSERT_EQ(l->size, 2);
    ASSERT_NE(l->head, l->last);
    ASSERT_EQ(l->last->next, (void *)NULL);
    ASSERT_EQ(l->last->value, (void *)&val1);
    ASSERT_EQ(l->head->next, l->last);
    ASSERT_EQ(l->head->value, (void *)&val2);
}

TEST_F(InsertTestFixture, TwoNodesListInsertionAtTheBeginning) { ;
    int val1 = 1, val2 = 2, val3 = 3;
    lli_begin(it, list);
    ll_insert(list, it, (void *)&val1);
    lli_begin(it, list);
    ll_insert(list, it, (void *)&val2);
    lli_begin(it, list);
    ll_insert(list, it, (void *)&val3);

    ll_list * l = (ll_list *)list;
    ASSERT_EQ(l->size, 3);
    ASSERT_NE(l->head, l->last);
    ASSERT_EQ(l->last->next, (void *)NULL);
    ASSERT_EQ(l->last->value, (void *)&val1);
    ASSERT_EQ(l->head->next->next, l->last);
    ASSERT_EQ(l->head->next->value, (void *)&val2);
    ASSERT_EQ(l->head->value, (void *)&val3);
    ASSERT_EQ(l->head->next->next->next, (void *)NULL);
    ASSERT_EQ(l->head->next->next->value, (void *)&val1);
}

TEST_F(InsertTestFixture, EmptyListInsertAtTheEnd) { ;
    int val = 1;
    lli_end(it, list);
    ll_insert(list, it, (void *)&val);

    ll_list * l = (ll_list *)list;
    ASSERT_EQ(l->head, l->last);
    ASSERT_NE(l->head, (ll_node *)NULL);
    ASSERT_EQ(l->size, 1);
    ll_node * n = l->head;
    ASSERT_EQ(n->value, &val);
    ASSERT_EQ(n->next, (ll_node *)NULL);
}

TEST_F(InsertTestFixture, OneNodeListInsertAtTheEnd) { ;
  int val1 = 1, val2 = 2;
  lli_end(it, list);
  ll_insert(list, it, (void *)&val1);
  lli_end(it, list);
  ll_insert(list, it, (void *)&val2);

  ll_list * l = (ll_list *)list;
  ASSERT_EQ(l->size, 2);
  ASSERT_NE(l->head, l->last);
  ASSERT_EQ(l->last->next, (void *)NULL);
  ASSERT_EQ(l->last->value, (void *)&val2);
  ASSERT_EQ(l->head->next, l->last);
  ASSERT_EQ(l->head->value, (void *)&val1);
}
