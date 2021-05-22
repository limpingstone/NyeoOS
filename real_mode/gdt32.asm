
[bits 16]

gdt_32_start:
; null sector
    dq 0x0

; code sector
gdt_32_code:
    dw 0xffff
    dw 0x0000
    db 0x00
    db 0b10011010
    db 0b11001111
    db 0x00

; data sector
gdt_32_data:
    dw 0xffff
    dw 0x0000
    db 0x00
    db 0b10010010
    db 0b11001111
    db 0x00

gdt_32_end:

; define the GDT descriptor
gdt_32_descriptor:
    dw gdt_32_end - gdt_32_start - 1
    dd gdt_32_start

; pointers to code and data segments
code_seg_32:   equ gdt_32_code - gdt_32_start
data_seg_32:   equ gdt_32_data - gdt_32_start

