//
// Created by Mateusz Stompór on 20/06/2019.
//

#pragma once

#include <stddef.h>

typedef struct node {
    void * value;
    node * next;
} node;

typedef struct linked_list {
    node * head;
    size_t size;
} linked_list;

extern "C" void insert(linked_list * list, void * value);