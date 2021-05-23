
[bits 64]

lm_clear:

    push rdi
    push rax
    push rcx

    ; shift style into ah
    shl rdi, 8
    mov rax, rdi

    ; character into al
    mov al, space_char

    mov rdi, vga_start
    mov rcx, vga_size / 2

    rep stosw

    pop rcx
    pop rax
    pop rdi

    ret

