# Set minimum required CMake version
# This command will set the value of the CMAKE_MINIMUM_REQUIRED_VERSION variable to 3.10
cmake_minimum_required(VERSION 3.10)

# Set the project_name and version number
# Sets the name of the project, and stores it in the variable PROJECT_NAME
# sets the version number, and stores it in the vaiable PROJECT_VERSION
project(HelloWorld VERSION 1.0)

# Add sub directory
# Adds a subdirectory to the build. The source_dir specifies the directory 
# in which the source CMakeLists.txt and code files are located.
add_subdirectory(src/JamesStuffLib) 

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Add the executable
# Adds an executable target called <HelloWorld> to be built from the source files listed.
add_executable(HelloWorld src/main.cpp)

# Link libaries to EXE
# Links a Private Libary JamesStuff to the executable HelloWorld
target_link_libraries(HelloWorld PRIVATE JamesStuff)

# Add the targeted cpp features
target_compile_features(HelloWorld PUBLIC cxx_std_20)