all: 
	nasm boot.asm

open: 
	qemu-system-x86_64 -drive format=raw,file=boot

clean: 
	rm -f boot

