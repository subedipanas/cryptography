        .global power
        .text

/*
    Inputs:
    x0  - base
    x1  - power

    Variables:
    x2 - counter
    x3 - result

    Outputs:
    x0  - base ^ power
*/
power:
    mov     x2, #0
    mov     x3, #1

1:
    cmp     x2, x1
    bge     5f
    
    mul     x3, x3, x0
    add     x2, x2, #1
    
    b       1b

5:
    mov     x0, x3
    ret