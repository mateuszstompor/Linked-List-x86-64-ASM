FROM gcc:9.1.0 AS ENVIRONMENT

RUN apt update && apt install -y cmake
RUN apt install nasm

COPY ./CMakeLists.txt /var/tmp/linked_list/CMakeLists.txt
COPY ./source /var/tmp/linked_list/source/
COPY ./tests /var/tmp/linked_list/tests/
COPY ./tests/install_gtest.sh /var/tmp/gtest/install_gtest.sh

RUN /var/tmp/gtest/install_gtest.sh
RUN cd /var/tmp/linked_list && cmake . -DBUILD_TESTING=ON && make all

ENTRYPOINT /var/tmp/linked_list/linked_list_tests
