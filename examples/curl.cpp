#!/usr/bin/env cppsh

// cppsh::LIBS -lcurl
// cppsh::LDFLAGS -L/opt/local/lib

#include <iostream>
#include <curl/curl.h>

int main( int argc, char* argv[] ) {
    std::cout << curl_version() << std::endl;
    return 0;
}
