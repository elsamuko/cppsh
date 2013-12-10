#!/usr/bin/env cppsh

#include <iostream>
#ifndef _WIN32
#include <initializer_list>
#endif

int main( int argc, char* argv[] ) {
    
    for( int i = 0; i < argc; ++i ) {
        std::cout << i << ". arg: " << argv[i] << std::endl;
    }
    
    std::cout << "hello" << std::endl;
    
#ifndef _WIN32
    for( auto i : { 1,2,3,4 } ) {
        std::cout << i << std::endl;
    }
#else
    std::cout << "sorry, no initializer lists for vs2012" << std::endl;
#endif
    
    return 0;
}


