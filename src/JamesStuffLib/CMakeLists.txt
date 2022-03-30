# Create a libary linker
add_library(
    JamesStuff STATIC
    printer.h
    printer.cpp
)

target_include_directories(JamesStuff PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/JamesStuffLib")