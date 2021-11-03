#!/usr/bin/env bash

# GNU grep is ggrep on macOS
if [ "$(uname)" == "Darwin" ]; then
    GREP="ggrep"
    TEMP_DIR="${TMPDIR}cppsh"
    TEST_DIR="${TMPDIR}cppsh_test"
else
    TEMP_DIR="/tmp/cppsh"
    TEST_DIR="/tmp/cppsh_test"
    GREP="grep"
fi

function assert {
    [[ ! "$1" ]] && echo "assertion failed" && exit 1
}

function pleaseRemove {
    if [ -f "$1" ]; then
        rm "$1"
    fi
    if [ -d "$1" ]; then
        rm -rf "$1"
    fi
}

function doPrepare {
    pleaseRemove "$TEMP_DIR"
    pleaseRemove "$TEST_DIR"
    mkdir -p "$TEST_DIR"
}

# testWithOutput source expected
function testWithOutput {
    echo -n "$1" > "$TEST_DIR/simple.cpp"
    RES=$(./cppsh "$TEST_DIR/simple.cpp")
    # ./cppsh "$TEST_DIR/simple.cpp"

    assert "$(echo "$RES" | "$GREP" "$2")"
}

function testSimple {
    local OUT="Hello from testSimple"
    local SRC="#!/usr/bin/env cppsh
#include <iostream>
int main() {
    std::cout << \"$OUT\" << std::endl;
    return 0;
}
"
    testWithOutput "$SRC" "$OUT"
}

function testCompileError {
    local OUT="Cannot compile testCompileError"
    local SRC="#!/usr/bin/env cppsh
#error \"$OUT\"
"
    testWithOutput "$SRC" "$OUT"
}

function testNoSource {
    pleaseRemove "$TEST_DIR/simple.cpp"
    RES=$(./cppsh "$TEST_DIR/simple.cpp")

    assert "$(echo "$RES" | "$GREP" "Hello from simple.cpp")"
}

function testCpp11 {
    local OUT="Hello from testSimple"
    local SRC="#!/usr/bin/env cppsh
#include <iostream>
int main() {
    for( const auto& i : { 1, 2, 3 } ) {
        std::cout << i << \"$OUT\" << std::endl;
    }
    return 0;
}
"
    testWithOutput "$SRC" "$OUT"
}

function testCpp14 {
    local OUT="Hello from testSimple"
    local SRC="#!/usr/bin/env cppsh
#include <iostream>
#include <chrono>
using namespace std::chrono_literals;
int main() {
    auto tenHours = 10h;
    std::cout << tenHours.count() << \"$OUT\" << std::endl;
    return 0;
}
"
    testWithOutput "$SRC" "$OUT"
}

function testCpp17 {
    local OUT="Hello from testSimple"
    local SRC="#!/usr/bin/env cppsh
#include <iostream>
#include <optional>
#include <string>
int main() {
    std::optional<std::string> test = \"opt: \";
    std::cout << *test << \"$OUT\" << std::endl;
    return 0;
}
"
    testWithOutput "$SRC" "$OUT"
}

function testCpp20 {
    local OUT="Hello from testSimple"
    local SRC="#!/usr/bin/env cppsh
#include <iostream>
#include <numbers>
int main() {
    if( std::numbers::pi > 3.f ) {
        std::cout << std::numbers::pi << \"$OUT\" << std::endl;
    }
    return 0;
}
"
    testWithOutput "$SRC" "$OUT"
}

doPrepare

echo "Running testSimple"
testSimple

echo "Running testCompileError"
testCompileError

echo "Running testNoSource"
testNoSource

echo "Running testCpp11"
testCpp11

echo "Running testCpp14"
testCpp14

echo "Running testCpp17"
testCpp17

echo "Running testCpp20"
testCpp20

echo "Tests succeeded"
