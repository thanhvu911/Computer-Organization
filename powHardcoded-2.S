.data
string: .asciz "This program prints 5^6...\n"
number: .word 15625

.text
.globl _main

    _main:
        # Print the string
        la a0, string
        li a7, 4
        ecall

        # Print the number
        lw a0, number
        li a7, 1
        ecall

    _end:
        li a0, 0
        li a7, 93
        ecall