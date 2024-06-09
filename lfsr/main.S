        .global main
        .text

main:
    stp     x19, x20, [sp, -16]!
    stp     x21, x30, [sp, -16]!

    ldr     x0, =in_prompt1
    bl      c_scanf_long            // get initial value
    mov     x19, x0

    ldr     x0, =in_prompt2
    bl      c_scanf_long            // get XOR value
    mov     x20, x0

    ldr     x0, =in_prompt3
    bl      c_scanf_long            // get size
    mov     x21, x0

    mov     x0, x19
    mov     x1, x20
    mov     x2, x21
    bl      lfsr                    // branch to main lfsr function with inputs

    ldp     x21, x30, [sp], 16
    ldp     x19, x20, [sp], 16
    mov     x0, xzr
    ret

    


        .data
in_prompt1:     .asciz  "Initial value: "
in_prompt2:     .asciz  "XOR value: "
in_prompt3:     .asciz  "Size: "