        .global xor_reduce_to_bit
        .text

/*
    Inputs:
    x0  - number to reduce to bit with xor
    
    Variables:
    x1, x2  - scratch

    Outputs:
    x0  - single reduced bit
*/

xor_reduce_to_bit:
    mov     x1, x0
    mov     x0, #0

5:
    cbz     x1, 10f

    and     x2, x1, #1
    eor     x0, x0, x2
    lsr     x1, x1, #1

    b       5b

10:
    ret