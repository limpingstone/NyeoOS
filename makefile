all: 
	cd bootloader; nasm boot.asm

	cd kernel; nasm entry.asm -f elf64 -o entry.o
	cd kernel; clang kernel.c -c -ffreestanding -target x86_64-none-elf -o kernel.o

	cd kernel; ld.lld -o kernel -Ttext 0x8200 --oformat binary entry.o kernel.o

	cp bootloader/boot os.img
	cat kernel/kernel >> os.img
	

open: 
	qemu-system-x86_64 -drive format=raw,file=os.img

clean: 
	rm -f os.img
	rm -f bootloader/boot
	rm -f kernel/*.o
	rm -f kernel/kernel.elf

