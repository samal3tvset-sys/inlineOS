.global _kernel_entry
.section .text

_kernel_entry:
    mov x0, #0
    bl kernel_main

_kernel_hang:
    wfi
    b _kernel_hang
