        .global lfsr
        .text

/*
    Inputs:
    x0  - initial value
    x1  - xor value
    x2  - size

    Variables:
    x19 - initial value and lfsr state
    x20 - xor value
    x21 - size
    x22 - max counter
    x23 - counter
    x24 - size-1

    Outputs:
    x0  - 0
*/

lfsr:
    str     x30, [sp, -16]!
    stp     x19, x20, [sp, -16]!
    stp     x21, x22, [sp, -16]!
    stp     x23, x24, [sp, -16]!

    mov     x19, x0
    mov     x20, x1
    mov     x21, x2
    sub     x24, x21, #1


    // get max iterations
    mov     x0, #2
    mov     x1, x21
    bl      power

    sub     x22, x0, #1


    // initialize counter and start loop
    mov     x23, #0
    b       10f

5:

    // extract 1 bit from the right and print to buffer
    and     x1, x19, #1
    ldr     x0, =out_format
    bl      printf

    // calculate new value to add to the left
    and     x0, x19, x20
    bl      xor_reduce_to_bit

    // x0 holds new value to add
    lsl     x0, x0, x24
    lsr     x19, x19, #1
    eor     x19, x19, x0
    
    add     x23, x23, #1

10:
    cmp     x23, x22
    blt     5b

    
    // print the buffer by appending new line
    ldr     x0, =newline
    bl      printf

    
    
    ldp     x23, x24, [sp], 16
    ldp     x21, x22, [sp], 16
    ldp     x19, x20, [sp], 16
    ldr     x30, [sp], 16
    mov     x0, xzr
    ret

        .data
out_format:     .asciz  "%d"
newline:        .asciz  "\n"