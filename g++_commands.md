## Comprehensive g++ Compilation Guide and Flags Reference
```bash
# 1. Simply build main.cpp file and generate a.out (default executable)
g++ main.cpp

# 2. Build multiple C++ source files into a single executable
g++ file1.cpp file2.cpp ... fileN.cpp

# 3. Only perform preprocessing and output preprocessed source (default: a.ii)
g++ -E main.cpp -o main.ii

# 4. Compile to assembly code only (default output: a.s)
g++ -S main.cpp -o main.s

# 5. Compile to machine code / object file only (default: a.o)
g++ -c main.cpp -o main.o

# 6. Generate all intermediate files: .ii, .s, .o, and the final executable
g++ -save-temps main.cpp

# 7. Link object files (or other intermediates) to produce executable
g++ main.o -o main

```


### ARGUMENTS

```bash
-o <file_name>         # Set the name of the output file
-c                     # Compile only, do not link
-std=c++17             # Use C++17 standard
-I<dir>                # Add directory to the include search path
-L<dir>                # Add directory to the library search path
-l<lib>                # Link with the specified library (e.g., -lm for libm)

-O0                    # No optimization (default)
-O1                    # Basic optimization
-O2                    # Good optimization level, safe for most cases
-O3                    # Aggressive optimization (may increase size)
-Ofast                 # Disregards strict standards compliance for speed
-Os                    # Optimize for size
-flto                  # Enable Link Time Optimization (LTO)

-g                     # Generate debug info for use with gdb
-fverbose-asm          # Include original source code as comments in .s file
-ggdb                  # Optimized for GDB debugging
-pg                    # Enable profiling using gprof

```