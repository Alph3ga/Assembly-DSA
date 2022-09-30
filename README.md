# Assembly-DSA

### This is the repository for my data structures and algorithms written in x86-64 assembly, and C++ header files for the same to be integrated into C++ programs

To use any of these in your C++ program,  
- Produce the required object file for your operating system using a compiler  
- For example, to produce a Microsoft COFF file for Windows 64 bit using nasm, `nasm -f win64 assemblyfile.asm -o assemblyfile.o`   
- Include the corresponding header file in your source file `#include "assemblyfile.h"`
- Use the functions with parameters and return values given in the header file
- Link the previously made object file with your source file
- For example, using GCC 8.1.0 for Windows 64 bit to produce executable, `g++ sourcecode.cpp assemblyfile.o -o sourcecode.exe`
