//
// Created by Mateusz Stompór on 20/06/2019.
//

#pragma once

#include <stdlib.h>
#include <gtest/gtest.h>
#include <linked_list.h>

TEST (InsertTest, InitAndRelease) {
    linked_list list;
    int * value = (int *)malloc(sizeof(int));
    *value = 3;
    insert(&list, (void *)value);
    free(value);
}
