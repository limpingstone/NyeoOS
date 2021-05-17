[org 0x7c00]

[bits 16]

jmp $

times 510 - ($ - $$) db 0x00

dw 0xaa55

