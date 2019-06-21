#!/bin/bash


/var/tmp/linked_list/linked_list_tests
valgrind --leak-check=full --show-leak-kinds=all --error-exitcode=1 --show-leak-kinds=definite --errors-for-leak-kinds=definite /var/tmp/linked_list/linked_list_tests
