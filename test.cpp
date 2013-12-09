#!/usr/bin/env cppsh

#include <iostream>
#include <initializer_list>

int main() {
    std::cout << "hello" << std::endl;
    
    for( auto i : { 1,2,3,4 } ) {
        std::cout << i << std::endl;
    }
    
    return 0;
}


