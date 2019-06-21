//
// Created by Mateusz Stompór on 20/06/2019.
//

#include "test_size.h"
#include "test_alloc_dealloc_list.h"
#include "test_alloc_dealloc_iterator.h"

int main (int argc, char **argv) {
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
