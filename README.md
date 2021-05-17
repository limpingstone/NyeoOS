# NyeoOS
NyeoOS is a 64-bit operating system developed for learning about programming an x86_64 operating system from scratch. It is inspired by project 
[64bit-os-tutorial](https://github.com/limpingstone/64bit-os-tutorial), a simplified OS tutorial that focuses on introducing the essentials of implementing a 64-bit operating system. 

## Building
To build and run NyeoOS, you will need to use the Netwide Assembler (NASM), QEMU and the GCC cross-compiling toolchain. The packages are listed below: 
- nasm 
- qemu
- i686-elf-gcc

The repository contains a makefile that lets you build and run NyeoOS with NASM and QEMU: 
```
$ make; make open
```


