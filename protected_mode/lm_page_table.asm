
[bits 32]

pt_init:
    pushad

    ; page table size = 4k = 4096
    ; starting at 0x1000
    mov edi, 0x1000

    ; save PML4T start address 0x1000 in cr3
    mov cr3, edi

    ; each iteration writes a 0
    xor eax, eax

    ; iterate 4096 times
    mov ecx, 4096

    ; execute the zeroing out process
    rep stosd

    ; set cr3 back to 0x1000
    mov edi, cr3

    ; set up PDPT, PDT, PT
    mov dword[edi], 0x2003
    add edi, 0x1000
    mov dword[edi], 0x3003
    add edi, 0x1000

    ; fill in the final page table
    add edi, 0x1000
    mov ebx, 0x00000003
    mov ecx, 512

    pm_add_page_entry:
        mov dword[edi], ebx
        add ebx, 0x1000
        add edi, 8

        loop pm_add_page_entry

    ; set page address extension
    mov eax, cr4
    or eax, 1 << 5
    mov cr4, eax

    popad
    ret

