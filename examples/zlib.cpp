#!/usr/bin/env cppsh

// cppsh::CPPFLAGS /Izlib_win
// cppsh::LIBS /link /LIBPATH:zlib_win zlib.lib

#include <iostream>
#include <zlib.h>

int main( int argc, char* argv[] ) {
    std::cout << zlibVersion() << std::endl;
    return 0;
}
