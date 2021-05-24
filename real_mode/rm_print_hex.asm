
[bits 16]

rm_print_hex:
    push ax
    push bx
    push cx

    mov ah, 0x0e

    ; print 0x prefix for hexadecimals
    mov al, '0'
    int 0x10
    mov al, 'x'
    int 0x10

    mov cx, 4

rm_print_hex_loop:
    ; when all numbers are run
    cmp cx, 0
    jmp rm_print_hex_end

    push bx

    ; get the left-most nibble
    shr bx, 12
    cmp bx, 10
    jge rm_print_hex_alphabet

    ; 0 - 9 represented with original digits
    mov al, '0'
    add al, bl

    jmp rm_print_hex_loop_end

rm_print_hex_alphabet:

    ; 10 - 15 represented with A - F
    sub bl, 10
    mov al, 'A'
    add al, bl

rm_print_hex_loop_end:

    ; print current charater
    int 0x10

    ; next iteration
    pop bx
    shl bx, 4
    dec cx

    jmp rm_print_hex_loop

rm_print_hex_end:
    pop cx
    pop bx
    pop ax

    ret

