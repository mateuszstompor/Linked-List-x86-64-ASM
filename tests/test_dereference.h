//
// Created by Mateusz Stompór on 25/06/2019.
//

#pragma once

#include <gtest/gtest.h>
#include <linked_list.h>

#include "helpers.h"


class DereferenceIteratorTestFixture : public ::testing::Test {
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


TEST_F(DereferenceIteratorTestFixture, OneElementList) { ;
    int value = 10;
    lli_begin(it, list);
    ll_insert(list, it, (void *)&value);
    lli_begin(it, list);
    ASSERT_EQ(lli_dereference(it), (void *)&value);
}
