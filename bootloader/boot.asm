; CONSTANTS
%include "include/include.asm"

; memory offset for loading the first sector of the hard drive
[org 0x7c00]

; 16-bit real mode
[bits 16]
begin_real:

    ; init stack pointers
    mov bp, 0x0500
    mov sp, bp

    ; determine the boot drive
    mov byte[boot_drive], dl

    ; print BIOS load message
    mov bx, boot_msg
    call rm_print

    ; load more sectors
    mov al, 0x03    ; boot sector size
    mov cl, 0x02    ; boot sector to be read from
    mov bx, 0x7e00  ; destination
    call rm_load

    ; elevate to 32-bit protected mode
    call elevate_pm

    jmp $


; INCLUDE for real mode
%include "real_mode/rm_print.asm"
%include "real_mode/rm_print_hex.asm"
%include "real_mode/rm_load.asm"
%include "real_mode/gdt32.asm"
%include "real_mode/pm_elevate.asm"


; DATA section for real mode
boot_msg:   db `Loading boot sector from Hard Disk...\r\n`, 0

; padding for the rest of the boot sector
times 510 - ($ - $$) db 0x00

; the magic number
dw 0xaa55


; bootsector for protected mode
begin_protected:
[bits 32]
    ; clear screen
    call pm_clear

    ; print message
    mov esi, pm_msg
    call pm_print

    call elevate_lm

    jmp $


; INCLUDE for protected mode
%include "protected_mode/pm_clear.asm"
%include "protected_mode/pm_print.asm"
%include "protected_mode/gdt64.asm"
%include "protected_mode/lm_detect.asm"
%include "protected_mode/lm_page_table.asm"
%include "protected_mode/lm_elevate.asm"

; DATA section for protected mode
pm_msg:     db `Now in 32-bit protected mode`, 0


times 512 - ($ - begin_protected) db 0x00


; bootsector for long mode
begin_long_mode:
[bits 64]

    mov rdi, vga_style_bg_blue
    call lm_clear

    mov rdi, vga_style_bg_blue
    mov rsi, lm_msg
    call lm_print

    call kernel_start

    ; infinite loop to halt the booting screen
    jmp $

; INCLUDE for long mode
%include "long_mode/lm_clear.asm"
%include "long_mode/lm_print.asm"

; DATA section for long mode
lm_msg:     db `Now in 64-bit long mode!`, 0

times 512 - ($ - begin_long_mode) db 0x00

