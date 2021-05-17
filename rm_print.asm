[bits 16]

rm_print:
    ; reserve ax, bx for use
    push ax
    push bx

    ; BIOS print mode
    mov ah, 0x0e

rm_print_loop:
    ; if the character at bx is the end of the string, then end loop
    cmp byte[bx], 0
    je rm_print_end

    ; otherwise, print the character
    mov al, byte[bx]
    int 0x10

    ; move to the next character for next iteration
    inc bx
    jmp rm_print_loop

rm_print_end:
    ; restore bx, ax from the stack and resume program
    pop bx
    pop ax
    ret

