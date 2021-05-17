
[bits 32]

pm_print:
    pusha
    mov edx, vga_start

pm_print_loop:
    ; test whether it's the end of the string
    cmp byte[esi], 0
    je pm_print_end

    ; set character and style
    mov al, byte[esi]
    mov ah, vga_style

    ; print character
    mov word[edx], ax

    ; next iteration
    inc esi
    add edx, 2
    jmp pm_print_loop

pm_print_end:
    popa
    ret

