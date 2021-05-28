all: 
	cd bootloader; nasm boot.asm

open: 
	qemu-system-x86_64 -drive format=raw,file=bootloader/boot

clean: 
	rm -f bootloader/boot

