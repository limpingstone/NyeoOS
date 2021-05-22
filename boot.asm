; CONSTANTS
%include "include/include.asm"

; memory offset for loading the first sector of the hard drive
[org 0x7c00]

; 16-bit real mode
[bits 16]
begin_real:

    ; print message
    ;mov bx, boot_msg
    ;call rm_print

    ; elevate to 32-bit protected mode
    call elevate_pm

[bits 32]
begin_protected:

    ; clear screen
    call pm_clear

    ; print message
    mov esi, pm_msg
    call pm_print

    ; infinite loop to halt the booting screen
    jmp $

; INCLUDES
%include "real_mode/rm_print.asm"
%include "real_mode/gdt32.asm"
%include "real_mode/pm_elevate.asm"

%include "protected_mode/pm_clear.asm"
%include "protected_mode/pm_print.asm"
%include "protected_mode/gdt64.asm"
%include "protected_mode/lm_detect.asm"
%include "protected_mode/lm_page_table.asm"

; DATA SECTION
;boot_msg:   db `Loading boot sector from Hard Disk...\r\n`, 0
pm_msg:     db `Now in 32-bit protected mode`, 0

; padding for the rest of the boot sector
times 510 - ($ - $$) db 0x00

; the magic number
dw 0xaa55


