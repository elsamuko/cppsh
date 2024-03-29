# cppsh

`cppsh` is a shell script that "interprets" single C++ files.

## Usage

    $ cppsh source.cpp

You can also initialize your `.cpp` file with the following line:

    #!/usr/bin/env cppsh

And then execute the file directly:

    $ chmod +x file.cpp
	$ ./file.cpp

If the source file does not exist, it is created with a hello world stump.

    $ cppsh doesNotExist.cpp

## Flags

You can add compile/linker flags with special comments:
```cpp
   // cppsh::CPPFLAGS -DLOG=1
   // cppsh::CXXFLAGS -march=native
   // cppsh::LDFLAGS -flto
   // cppsh::LIBS -lcurl
   // cppsh::VERBOSE 1
```

## Example

The file `test.cpp` shows all commandline arguments.

