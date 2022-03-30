# HelloWorldTerminalCMake
HelloWorld built through terminal and CMake
## Instructions
* Download and install msys2 following the install instructions on their site.
* Update environment variables:
	> * Hit the Winkey typing "env" and selecting "Edit the system enviroment variables"
	> * Press the environment variables buttom and the Advanced tab
	> * In the System variables section look for the "Path" entry, select it and hit "Edit"
	> * Click "New" and enter the location of the MSYS2 mingw64 bin directory (C:\msys64\mingw64\bin)
	> * Okay out of all open windows

* Open MSYS2 MinGW x64 Terminal
* Run the folowing:
	> * mkdir HelloWorldTerminal
	> * mkdir HelloWorldTerminal/src
	> * cd HelloWorldTerminal/src
	> * nano main.cpp
	
This creates the directory HelloWorldTerminal that we will be working in as well as the src folder for our source files
This then opens up the nano text editor so we can enter stuff into a main.cpp file.

* When nano editor opens up, type the hello world cpp code:
```cpp
#include <iostream>
int main(){
	std::cout << "Hello World" << std::endl;
	return 0;
}
```
* Press CTRL+X to exit and save the file.
* Run the folowing:
	> * cd ..
	> * nano CMakeLists.txt

* Enter the following to create the cmake file (# lines can be ignored)
```
# Set minimum required CMake version
cmake_minimum_required(VERSION 3.10)

# Set the project_name and version
project(HelloWorld VERSION 1.0)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Add the executable
add_executable(HelloWorld src/main.cpp)

# Add the targeted cpp features
target_compile_features(HelloWorld PUBLIC cxx_std_20)
```
* Press CTRL+X to exit and save the file.

* Run the folowing:
	> * cd build
	> * cmake -G \"MSYS Makefiles\" ..
	> * make
	> * ./HelloWorld