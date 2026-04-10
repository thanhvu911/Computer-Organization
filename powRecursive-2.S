.data
string: .asciz "This program computes 2^3...\n"

.text
.globl _main

    _main:
        # Print the initial message
        la a0, string
        li a7, 4
        ecall

        # Initialize base and exponent
        li a0, 2
        li a1, 3

        # Call power function
        jal ra, _pow

        # Print the result
        mv t0, a0
        li a7, 1
        mv a0, t0
        ecall

    _end:
        # Exit program
        li a7, 93
        li a0, 0
        ecall

    _pow:
        # Check if exponent (a1) is zero
        li t0, 0
        beq a1, t0, _base_case

        # Save return address and registers
        addi sp, sp, -8
        sw ra, 4(sp)
        sw a0, 0(sp)

        # Recursive case: decrement exponent and call _pow
        addi a1, a1, -1
        jal ra, _pow

        # Restore base and multiply result
        lw t1, 0(sp)
        mul a0, a0, t1

        # Restore return address and stack pointer
        lw ra, 4(sp)
        addi sp, sp, 8
        ret

    _base_case:
        li a0, 1           # Base case result: 1
        ret
