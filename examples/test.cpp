#!/usr/bin/env cppsh

#if defined(_WIN32) && (_MSC_VER >= 1800) // VS 2013 and later
#define HAS_INITIALIZER_LISTS
#elif !defined(_WIN32) // clang++ and g++
#define HAS_INITIALIZER_LISTS
#endif

#include <iostream>
#ifdef HAS_INITIALIZER_LISTS
#include <initializer_list>
#endif


#include "foo/bar.h"

int main( int argc, char* argv[] ) {
    
    for( int i = 0; i < argc; ++i ) {
        std::cout << i << ". arg: " << argv[i] << std::endl;
    }
    
    // from bar.h
    some::func();
    
#ifdef HAS_INITIALIZER_LISTS
    for( auto i : { 1,2,3,4 } ) {
        std::cout << i << std::endl;
    }
#else
    std::cout << "sorry, no initializer lists for vs2012" << std::endl;
#endif
    
    return 0;
}


