## Linked-List-x86-64-ASM &middot; [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) [![CI](https://github.com/mateuszstompor/Linked-List-x86-64-ASM/actions/workflows/ci.yml/badge.svg?branch=master)](https://github.com/mateuszstompor/Linked-List-x86-64-ASM/actions/workflows/ci.yml)

> linked list is a linear collection of data elements whose order is not given by their physical placement in memory. 
> Instead, each element points to the next. 
> It is a data structure consisting of a collection of nodes which together represent a sequence

In contrary to other available implementations... This is written in assembly with its interface exposed to C

## An example
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

  // delete the value
  ll_delete(list, it);

  // release after using the iterator;
  lli_release(it);

  // release the list
  ll_release(list);
}
```
## Convention
All functions of the library start with `ll` prefix, as you might guess it stands for `linked list`.
Each linked list has an associated compare function.
It is used to search and check for existence of an element.
Do not store objects of different types in the list

## What is going on under the hood?
<h4>Linked list structure</h4>

<table>
    <tr>
        <th>Variable name</th>
        <th>Size</th>
        <th>Description</th>
    </tr>
    <tr>
        <td>head</td>
        <td>8 bytes</td>
        <td>Pointer to the first node</td>
    </tr>
    <tr>
        <td>last</td>
        <td>8 bytes</td>
        <td>Pointer to the last node</td>
    </tr>
    <tr>
        <td>compare_function</td>
        <td>8 bytes</td>
        <td>Function used to compare elements against each other</td>
    </tr>
    <tr>
        <td>size</td>
        <td>8 bytes</td>
        <td>Amount of elements in the list</td>
    </tr>
</table>

<h4>Node structure</h4>

<table>
    <tr>
        <th>Variable name</th>
        <th>Size</th>
        <th>Description</th>
    </tr>
    <tr>
        <td>value</td>
        <td>8 bytes</td>
        <td>Pointer to the stored value</td>
    </tr>
    <tr>
        <td>next</td>
        <td>8 bytes</td>
        <td>Pointer to the next node</td>
    </tr>
</table>

<h4>Iterator structure</h4>

<table>
    <tr>
        <th>Variable name</th>
        <th>Size</th>
        <th>Description</th>
    </tr>
    <tr>
        <td>current</td>
        <td>8 bytes</td>
        <td>Pointer to the current node</td>
    </tr>
    <tr>
        <td>previous</td>
        <td>8 bytes</td>
        <td>Pointer to the node before current</td>
    </tr>
</table>

## Supported platforms
Library works only on 64-bit systems
<ul>
    <li>macOS</li>
    <li>linux</li>
</ul>

## Dependencies
<ul>
    <li>nasm (tested on 2.13.03)</li>
    <li>gtest (tested on 1.8.1)</li>
    <li>gcc with C++14 support (tested on 9.1.0)</li>
    <li>cmake (tested on 3.0.7)</li>
</ul>

## Running tests
Build docker image firstly, execute the command from the root folder of repository
```bash
docker build -f ./tests/Dockerfile -t linked_list_tests .
```

Run the container
```bash
docker run --rm -it linked_list_tests all
```

## Installing
Configure the project
```bash
cmake . -DCMAKE_BUILD_TYPE=Release
```

Then, install the library and its headers. It is going to be a static lib.

```bash
make install
```

## Contributing
Contributions are welcome! Please fork the repository and submit a pull request. For major changes, please open an issue first to discuss what you would like to change.

## Contact
For support or inquiries, please open an issue on the [GitHub repository](https://github.com/mateuszstompor/Linked-List-x86-64-ASM/issues).