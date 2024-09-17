#!/bin/bash

# project name
PROJ=$1

# example: create-app -cpp irc-chat or create-app -c irc-chat
function add_c_files() {
    MAIN_FXN=""
    MAKEFILE=""
    touch "src/main.c"
    touch "Makefile"
}

function add_folders() {
    echo "creating folders..."
    mkdir -p "${PROJ}"
    cd "${PROJ}"
    mkdir "src"
    mkdir "include"
    mkdir "test"
}

function add_cpp_files() {
    CMAKE_VALUE="cmake_minimum_required(VERSION 3.16)\n
\nproject(${PROJ})\nset(CMAKE_CXX_STANDARD 17) # Set C++ standard\n
\nadd_executable(${PROJ} src/main.cpp)\n
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
    add_cpp_files
    echo "creating done..."
}

main