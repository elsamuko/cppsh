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

#define LOG(A) std::cout << A << std::endl;

int main( int argc, char* argv[] ) {

    LOG( "C++ " << __cplusplus );
    
    for( int i = 0; i < argc; ++i ) {
        LOG( i << ". arg: " << argv[i] );
    }
    
    // from bar.h
    some::func();
    
#ifdef HAS_INITIALIZER_LISTS
    for( auto i : { 1,2,3,4 } ) {
        LOG( i );
    }
#else
    LOG( "sorry, no initializer lists for vs2012" );
#endif
    
    return 0;
}


