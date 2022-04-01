#!/bin/bash
##########################################################
#
# PLACE IN ROOT DIR OF PROJECT
# RUN ./makecmake.sh TO CREATE ALL REQUIRED CMAKE FILES
# RUN ./build/build.sh TO BUILD ALL EXE FILES
#
##########################################################


#################
#Get User Values#
#################
echo "# Set minimum required CMake version to: (Example 3.10)"
read version

echo ""
echo "# Set project name to: (Example HelloWorld)"
read projectName

echo ""
echo "# Set project version to: (Example 1.0)"
read projectVersion

echo ""
echo "# Location of cpp with main is: (Example scr/main.cpp)"
read sourceDir


################################
#Create the CMakeLists.txt file#
################################
echo "# Set minimum required CMake version
cmake_minimum_required(VERSION "$version")

# Set the project_name and version
project("$projectName" VERSION "$projectVersion")

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Add the executable
add_executable("$projectName" "$sourceDir")

# Add the targeted cpp features
target_compile_features("$projectName" PUBLIC cxx_std_20)" > CMakeLists.txt

echo ""
echo "CMakeLists.txt Created!"

################
#Make Build DIR#
################
mkdir build
echo ""
echo "Build Directory should now exist."
cd build
rm -r *
echo ""
echo "Build Directory should now be empty."
echo "#!/bin/bash
cmake -G \"MSYS Makefiles\" ..
make" > build.sh
echo ""
echo "Build Directory now has build.sh for quick build of exe."