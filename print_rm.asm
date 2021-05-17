[bits 16]

print_rm:
    ; reserve ax, bx for use
    push ax
    push bx

    ; BIOS print mode
    mov ah, 0x0e

print_rm_loop:
    ; if the character at bx is the end of the string, then end loop
    cmp byte[bx], 0
    je print_rm_end

    ; otherwise, print the character
    mov al, byte[bx]
    int 0x10

    ; move to the next character for next iteration
    inc bx
    jmp print_rm_loop

print_rm_end:
    ; restore bx, ax from the stack and resume program
    pop bx
    pop ax
    ret

