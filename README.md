# Linked-List-x86-64-ASM
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Build Status](https://travis-ci.org/mateuszstompor/Linked-List-x86-64-ASM.svg?branch=master)](https://travis-ci.org/mateuszstompor/Linked-List-x86-64-ASM)

# Convention
All functions of the library start with 'll' prefix, as you might guess it stands for 'linked list'.
Each linked list has an associated compare function.
It is used to search and check for existence of an element.
Do not store objects of different types in the list.

# Supported platforms
Library works only on 64-bit systems
<ul>
    <li>macOS</li>
    <li>linux</li>
</ul>

# Dependencies
<ul>
    <li>nasm (tested on 2.13.03)</li>
    <li>gtest (tested on 1.8.1)</li>
    <li>gcc with C++14 support (tested on 9.1.0)</li>
</ul>


# Running tests
Build docker image firstly, execute the command from the root folder of repository
```bash
docker build -f ./tests/Dockerfile -t linked_list_tests .
```

Run the container
```bash
docker run --rm -it linked_list_tests all
```

# Installing
Configure the project
```bash
cmake . -DCMAKE_BUILD_TYPE=Release
```

Then, install the library and its headers. It is going to be a static lib.

```bash
make install
```
# An example
```C
#include <stdio.h>
#include <linked_list>


int compare(void * lhs, void * rhs) {
    int l = *(int *)lhs;
    int r = *(int *)rhs;
    if (l == r) {
        return 0;
    } else if (l > r) {
        return 1;
    } else {
        return -1;
    }
}

int main() {
  // allocate list with the comparison function
  linked_list * list = ll_alloc(&compare);

  // check if the list is empty
  ll_empty(list)

  // create an iterator
  iterator * it = lli_alloc();

  // point the iterator at the head of the list
  lli_begin(it, list);

  // declare an element
  int element = 10;

  // add the element to the list
  ll_insert(list, it, (void *)&element)

  // after insertion the iterator is no longer valid
  // set it once again at the beginning of the list
  lli_begin(it, list);

  // get the value from the iterator
  printf("%d\n", *(int *)lli_dereference(it));

  // release after using the iterator;
  lli_release(it);

  // release the list
  ll_release(list);
}
```

# What is going on under the hood?
<h3>Linked list structure</h3>

```
+==================+=========+======================================================+
|  Variable name   |  Size   |                     Description                      |
+==================+=========+======================================================+
| head             | 8 bytes | Pointer to the first node                            |
+------------------+---------+------------------------------------------------------+
| last             | 8 bytes | Pointer to the last node                             |
+------------------+---------+------------------------------------------------------+
| compare_function | 8 bytes | Function used to compare elements against each other |
+------------------+---------+------------------------------------------------------+
| size             | 8 bytes | Amount of elements in the list                       |
+------------------+---------+------------------------------------------------------+
```
<h3>Node structure</h3>

```
+===============+=========+==============================+
| Variable name |  Size   |         Description          |
+===============+=========+==============================+
| value         | 8 bytes | Pointer to the stored value  |
+---------------+---------+------------------------------+
| next          | 8 bytes | Pointer to the next node     |
+---------------+---------+------------------------------+
```
<h3>Iterator structure</h3>

```
+===============+=========+====================================+
| Variable name |  Size   |            Description             |
+===============+=========+====================================+
| current       | 8 bytes | Pointer to the current node        |
+---------------+---------+------------------------------------+
| previous      | 8 bytes | Pointer to the node before current |
+---------------+---------+------------------------------------+
```
