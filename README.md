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
	
# Once done
Once the above has been done, you can update the cpp application and then simply run "cmake -G \"MSYS Makefiles\" .." followed by "make" inside of the minGW terminal while inside of the build folder.
To make this slightly easier we can actually create a batch file to do this for us, meaning we only have to then call one file to run.
* Inside of the build folder, create a build.sh file.
* Inside of this we enter the following code
```
#!/bin/bash
cmake -G "MSYS Makefiles" ..
make
```
Now when we run ./build.sh we will run both the cmake command and make command.

# Helpful Linux Terminal Commands
https://cheatography.com/davechild/cheat-sheets/linux-command-line/
* Get to root
cd /

* Get to home
cd ~

* Go up a dir
cd ..

* Go to previous dir
cd -

* Make folder
mkdir FolderName

* Delete Empty folder
rmdir

* Delete Folder and all inside
rm -r FolderName

* Copy file
cp fileToCopy destinationName

* List directory with info
ls -l

# Install CMake for Visual Studio Code
* Open Visual Studio code
* Open extentions
* Search for CMake Tools by Microsoft
* Install

## Configure
* Press file > Preferences > Settings
* Open the Extentions Dropdown, then select CMake Tools
* Scroll down to Cmake: Generator and enter MSYS Makefiles
* Look for CMake>Statusbar:Advanced and click Edit in settings.json
* Add the following just before the last }
```
"cmake.configureSettings": {

        "CMAKE_MAKE_PROGRAM": "C:/msys64/usr/bin/make.exe"

    }
```
* Make sure that you append a "," to the end of the last line that was in the settings too, as we are adding a new element
```
Example
    "cmake.generator": "MSYS Makefiles"
	to
    "cmake.generator": "MSYS Makefiles",
```
* Create the CMakeLists.txt
* Create a HelloWorld.cpp
* Press CTRL+SHIFT+P
* Type CMake:Configure
* You should now see in the dropdown lost GCC 11.2.0 for MinGW32
* Then Build

# Linking libaries
* Create a .h and .cpp file for a new libary
* In the .h add in the #ifndef stuff
* Create a namespace for the libary and add a function that libary can call
```
EXAMPLE
#ifndef PRINTER_H
#define PRINTER_H
#include <iostream>

namespace LibaryName{

    void Printer(std::string textToPrint);
}

#endif
```
* Inside the cpp file create the actual code for the function
* We now have a "libary" set up but it needs linking
* Open CMakeLists.txt
* Add the Namespace, cpp file and h file into a add_libary function
```
# Create a libary linker
add_library(
    LibaryName STATIC
    src/printer.h
    src/printer.cpp
)
```
* Link that new libary to the EXE of the project
```
# Link libaries to EXE
target_link_libraries(HelloWorld PRIVATE LibaryName)
```


# Including Sub Directories
* Create a folder in the same directory as the current CMakeLists.txt
* In the first CMakeLists.txt now add
```
add_subdirectory(folderName)
```
* Move your libary .cpp and .h into your new sub directory
* Create a CMakeLists.txt inside that the sub directory
* Move the add_libary() function from the first CMakeLists.txt into the new sub directory one
* Include 
```
target_include_directories(LibaryName PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/Path/To/Libary/Dir")
```
* Update any Includes to now point to new .h file locations
```
EXAMPLE
#include "printer.h"
to
#include "LibaryName/printer.h"
```
