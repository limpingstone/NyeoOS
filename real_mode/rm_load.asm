
[bits 16]

rm_load:
    push ax
    push bx
    push cx
    push dx

    ; number of sectors
    push ax

    ; BIOS read from disk
    mov ah, 0x02

    ; cylinder and cylinder head
    mov ch, 0x00
    mov dh, 0x00

    ; indicate the drive to load
    mov dl, byte[boot_drive]

    ; interrupt for read disk
    int 0x13

    ; jump if carry bit is set
    jc rm_disk_error

    ; compare actual read amount
    pop bx
    cmp al, bl
    jne rm_disk_error

    pop dx
    pop cx
    pop bx
    pop ax

    ret

rm_disk_error:
    ; print error message
    mov bx, error_msg
    call rm_print

    ; print error code
    shr ax, 8
    mov bx, ax
    call rm_print_hex

    jmp $

error_msg:      db `\r\nERROR Loading sectors. Code: `, 0

