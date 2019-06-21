# Linked-List-x86-64-ASM
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

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
docker run --rm -it linked_list_tests
```

# Installing
Configure the project
```bash
cmake .
```

Then, install the library and its headers. It is going to be a static lib.

```bash
make install
```

# What is going on under the hood?
<h3>Linked list structure</h3>
<br>

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
<br>
<h3>Node structure</h3>
<br>

```
+===============+=========+==============================+
| Variable name |  Size   |         Description          |
+===============+=========+==============================+
| value         | 8 bytes | Pointer to the stored value  |
+---------------+---------+------------------------------+
| next          | 8 bytes | Pointer to the next node     |
+---------------+---------+------------------------------+
```
