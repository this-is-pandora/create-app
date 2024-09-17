#!/bin/bash

# example: create-cpp irc-chat

function add_folders() {
    echo "creating folders..."
    mkdir -p $1
    cd $1
    mkdir "src"
    mkdir "include"
    mkdir "test"
}

function add_files() {
    CMAKE_VALUE="cmake_minimum_required(VERSION 3.16)\n
\nproject($1)\nset(CMAKE_CXX_STANDARD 17) # Set C++ standard\n
\nadd_executable($1 src/main.cpp)\n
\ninclude_directories(include)"

    MAIN_FXN="#include <iostream>\n
\nint main(int argc, char *argv[])\n{\n\tstd::cout << 'Hello, world!' << std::endl;\n
\treturn 0;\n}"

    echo "adding files..."
    touch "src/main.cpp"
    touch "README.md"
    echo -e $CMAKE_VALUE > CMakeLists.txt
    echo -e $MAIN_FXN > src/main.cpp
}

function main() {
    add_folders
    add_files
    echo "creating done..."
}

main