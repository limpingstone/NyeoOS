
[bits 32]

pm_clear:
    pushad

    mov ebx, vga_start
    mov ecx, vga_size
    mov edx, 0

pm_clear_loop:
    ; check whether the loop hits end of screen
    cmp edx, ecx
    jge pm_clear_end

    push edx

    ; print space onto screen
    mov al, space_char
    mov ah, vga_style
    add edx, ebx
    mov word[edx], ax

    pop edx

    ; iterating next character on screen
    add edx, 2
    jmp pm_clear_loop

pm_clear_end:
    popad
    ret

