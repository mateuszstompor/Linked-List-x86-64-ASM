#!/bin/bash

git clone -b release-1.10.0 https://github.com/google/googletest
cd googletest
mkdir build
cd build
cmake ..
make
make install
cd ../..
rm -rf googletest