# Set minimum required CMake version
cmake_minimum_required(VERSION 3.10)

# Set the project_name and version
project(HelloWorld VERSION 1.0)

# Add sub directory
add_subdirectory(src/JamesStuffLib) 

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Add the executable
add_executable(HelloWorld src/main.cpp)

# Link libaries to EXE
target_link_libraries(HelloWorld PRIVATE JamesStuff)

# Add the targeted cpp features
target_compile_features(HelloWorld PUBLIC cxx_std_20)