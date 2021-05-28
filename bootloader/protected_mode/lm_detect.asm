
[bits 32]

lm_detect:
    pushad

    ; get flags and store in eax
    pushfd
    pop eax

    ; save the original flags in ecx
    mov ecx, eax

    ; flip bit 21 (ID) and write in the flag change
    xor eax, 1 << 21
    push eax
    popfd

    ; restore the original flags from ecx and test value of ecx
    pushfd
    pop eax
    push ecx
    popfd

    ; exit if CPUID is not supported
    cmp eax, ecx
    je cpuid_not_found

    ; checking for long mode
    mov eax, 0x80000001
    cpuid
    test edx, 1 << 29
    jz lm_not_found

    ; long mode supported
    popad
    ret

lm_not_found:
    ; print error message when
    call pm_clear
    mov esi, lm_not_found_msg
    call pm_print
    jmp $

cpuid_not_found:
    call pm_clear
    mov esi, cpuid_not_found_msg
    call pm_print
    jmp $


lm_not_found_msg:       db `ERROR: Long mode not supported. Exiting...`, 0
cpuid_not_found_msg:    db `ERROR: CPUID unsupported but required for long mode.`, 0

