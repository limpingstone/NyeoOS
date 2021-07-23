CC  = clang
LD  = ld.lld
ASM = nasm
OBJCOPY = llvm-objcopy

CCFLAGS = -c -ffreestanding -target x86_64-none-elf
LDFLAGS = -T script.ld
ASFLAGS = -f elf64

all: 
	cd bootloader; $(ASM) boot.asm

	cd kernel; $(ASM) $(ASFLAGS) -o entry.o  entry.asm
	cd kernel; $(CC)  $(CCFLAGS) -o kernel.o kernel.c

	cd kernel; $(LD)  $(LDFLAGS) -o kernel.elf   entry.o kernel.o
	cd kernel; $(OBJCOPY) -O binary kernel.elf kernel.bin

	cp bootloader/boot os.img
	cat kernel/kernel.bin >> os.img
	

open: 
	qemu-system-x86_64 -drive format=raw,file=os.img

clean: 
	rm -f os.img
	rm -f bootloader/boot
	rm -f kernel/*.o
	rm -f kernel/kernel
	rm -f kernel/kernel.elf

