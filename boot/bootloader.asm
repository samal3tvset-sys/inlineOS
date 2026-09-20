.global _start
.section .text

_start:
    ldr x30, =_stack_top
    mov sp, x30

    bl kernel_main

_hang:
    wfi
    b _hang

.section .bss
.space 4096
_stack_top:
