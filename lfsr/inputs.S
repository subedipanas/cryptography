        .global c_scanf_long
        .text

/*
    Inputs:
    x0 - Address of prompt

    Outputs:
    x0 - Input value
*/

c_scanf_long:
    str     x30, [sp, -16]!

    bl      printf

    ldr     x0, =in_format
    sub     sp, sp, #16
    mov     x1, sp
    bl      scanf
    ldr     x0, [sp]                // return value
    add     sp, sp, #16

    ldr     x30, [sp], 16
    ret

        .data
in_format:  .asciz  "%d"