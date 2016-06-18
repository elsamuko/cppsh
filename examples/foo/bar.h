#pragma once

#include <iostream>

namespace some {
    void func() {
        std::cout << "hello from included " << __FILE__ << std::endl;
    }
}
