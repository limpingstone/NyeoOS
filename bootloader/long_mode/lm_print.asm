
[bits 64]

lm_print:

    push rax
    push rdx
    push rdi
    push rsi

    ; init index for string
    mov rdx, vga_start

    ; shift style code for ah
    shl rdi, 8

lm_print_loop:
    ; end of string
    cmp byte[rsi], 0
    je lm_print_done

    ; strings that are too long
    cmp rdx, vga_start + vga_size
    je lm_print_done

    ; print current character and style
    mov rax, rdi
    mov al, byte[rsi]

    mov word[rdx], ax

    ; next iteration
    inc rsi
    add rdx, 2
    jmp lm_print_loop

lm_print_done:

    pop rsi
    pop rdi
    pop rdx
    pop rax

    ret

