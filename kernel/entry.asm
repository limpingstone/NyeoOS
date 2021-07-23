[bits 64]

[extern main]

section .init

global _start
_start:
    call main
    jmp $

