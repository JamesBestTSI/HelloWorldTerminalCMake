#!/bin/bash
##########################################################
#
# PLACE IN ROOT DIR OF LIBARY
# RUN ./makeCmakeLibary.sh TO CREATE REQUIRED CMAKE FILE
#
##########################################################


#################
#Get User Values#
#################
echo "# Enter libary name:"
read libName

echo ""
echo "# Enter .cpp location from root CMakeLists.txt:"
read libCPP

echo ""
echo "# Enter .h location from root CMakeLists.txt:"
read libH

echo ""
echo "# Enter name of project it will link with:"
read project


################################
#Create the CMakeLists.txt file#
################################
echo "# Create a libary linker
add_library(
    "$libName" STATIC
    "$libH"
    "$libCPP"
)

# Link libaries to EXE
target_link_libraries("$project" PRIVATE "$libName")" > CMakeLists.txt

echo ""
echo "CMakeLists.txt Created!"