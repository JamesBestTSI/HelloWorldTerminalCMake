# Create a libary linker
# Creates a libary called JamesStuff that can then be includes into executables
add_library(
    JamesStuff STATIC
    printer.h
    printer.cpp
)

# Include the files in JamesStuffLib when creating this Libary
target_include_directories(JamesStuff PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/JamesStuffLib")