#!/bin/bash

function display_help {
    echo 'USAGE:'
    echo 'tests                 - Runs the tests'
    echo 'mem_check             - Runs the memory check'
    echo 'all                   - Runs both the tests and memory check'
}

function unit_tests {
    /var/tmp/linked_list/linked_list_tests
}

function memory_check {
    valgrind    --leak-check=full \
                --show-leak-kinds=all \
                --error-exitcode=1 \
                --show-leak-kinds=definite \
                --errors-for-leak-kinds=definite \
                /var/tmp/linked_list/linked_list_tests
}

if [[ "$#" -eq 0 || "$#" -ge 2 ]] ; then
    display_help
else
    if [[ "$1" = 'mem_check' ]] ; then
        memory_check
    elif [[ "$1" = 'tests' ]] ; then
        unit_tests
    elif [[ "$1" = 'all' ]] ; then
        unit_tests && memory_check
    fi
fi
