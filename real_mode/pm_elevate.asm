[bits 16]
elevate_pm:
    ; disable the receiving of interrupts
    cli

    ; load GDT
    lgdt [gdt_32_descriptor]


    ; enable 32-bit mod
    mov eax, cr0
    or eax, 0x1
    mov cr0, eax

    ; long jump
    jmp code_seg_32:init_pm

[bits 32]
init_pm:
    ; initialize segment registers
    mov ax, data_seg_32
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    ; initialize stack pointer
    mov ebp, 0x90000
    mov esp, ebp

    jmp begin_protected

