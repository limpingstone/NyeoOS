
[bits 32]

elevate_lm:

    ; enter 64 bit mode
    mov ecx, 0xc0000080
    rdmsr
    or eax, 1 << 8
    wrmsr

    ; enable paging
    mov eax, cr0
    or eax, 1 << 31
    mov cr0, eax

    ; load GDT
    lgdt[gdt_64_descriptor]

    jmp code_seg_64:init_lm


[bits 64]
    init_lm:
        cli

        mov ax, data_seg_64
        mov ds, ax
        mov es, ax
        mov fs, ax
        mov gs, ax
        mov ss, ax

        jmp begin_long_mode

