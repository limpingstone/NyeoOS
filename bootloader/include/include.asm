
; BOOT PARAM
boot_drive:             db 0x00

; CONSTANTS
vga_start:              equ 0xb8000
vga_size:               equ 80 * 25 * 2
vga_style_bg_black:     equ 0x0f
vga_style_bg_blue:      equ 0x1f

; CHARACTERS
space_char: equ ` `

; KERNEL START
kernel_start:           equ 0x8200

