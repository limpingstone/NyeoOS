
; memory offset for loading the first sector of the hard drive
[org 0x7c00]

; 16-bit real mode
[bits 16]
begin_real:

    ; print message
    mov bx, boot_msg
    call rm_print

    call elevate_pm

[bits 32]
begin_protected:

    ; infinite loop to halt the booting screen
    jmp $

; INCLUDES
%include "rm_print.asm"
%include "gdt.asm"
%include "elevate.asm"

; DATA SECTION
boot_msg:   db `Loading boot sector from Hard Disk...\r\n`, 0

; padding for the rest of the boot sector
times 510 - ($ - $$) db 0x00

; the magic number
dw 0xaa55


