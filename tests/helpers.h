//
// Created by Mateusz Stompór on 21/06/2019.
//

#pragma once


struct ll_node {
    void * value;
    struct ll_node * next;
};


struct ll_iterator {
    struct ll_node * current;
    struct ll_node * previous;
};


struct ll_list {
    struct ll_node * head;
    struct ll_node * last;
    int (* compare_function)(void *, void *);
    uint64_t size;
};

int compare(void * lhs, void * rhs) {
    return 0;
}
