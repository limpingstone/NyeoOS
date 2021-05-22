
[bits 32]

gdt_64_start:
; null sector
    dq 0x0

; code sector
gdt_64_code:
    dw 0xffff
    dw 0x0000
    db 0x00
    db 0b10011010
    db 0b11001111
    db 0x00

; data sector
gdt_64_data:
    dw 0xffff
    dw 0x0000
    db 0x00
    db 0b10010010
    db 0b10100000
    db 0x00

gdt_64_end:

; define the GDT descriptor
gdt_64_descriptor:
    dw gdt_64_end - gdt_64_start - 1
    dd gdt_64_start

; pointers to code and data segments
code_seg_64:   equ gdt_64_code - gdt_64_start
data_seg_64:   equ gdt_64_data - gdt_64_start

