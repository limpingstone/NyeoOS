
; memory offset for loading the first sector of the hard drive
[org 0x7c00]

; 16-bit real mode
[bits 16]

mov bx, boot_msg
call print_rm

; infinite loop to halt the booting screen
jmp $

; INCLUDES
%include "print_rm.asm"

; DATA SECTION
boot_msg:   db `Loading boot sector from Hard Disk...\r\n`, 0

; padding for the rest of the boot sector
times 510 - ($ - $$) db 0x00

; the magic number
dw 0xaa55

