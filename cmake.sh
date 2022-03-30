# PLACE IN ROOT DIR OF PROJECT
# RUN ./cmake.sh TO CREATE ALL BUILD AND EXE FILES
# USE ./build.sh IN FUTURE FOR REBUILDING

echo "# Set minimum required CMake version
cmake_minimum_required(VERSION 3.10)

# Set the project_name and version
project(HelloWorld VERSION 1.0)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Add the executable
add_executable(HelloWorld src/main.cpp)

# Add the targeted cpp features
target_compile_features(HelloWorld PUBLIC cxx_std_20)" > CMakeLists.txt

# Change Dir
cd build

# Clear the dir
rm -r *

echo "#!/bin/bash
cmake -G \"MSYS Makefiles\" ..
make" > build.sh

./build.sh

cd ..