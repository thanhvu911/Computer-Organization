.data
string: .asciz "This program computes 4^7...\n"

.text
.globl _main
    _main:
        la a0, string
        li a7, 4
        ecall

        li a0, 4
        li a1, 7

        jal ra, _pow

        mv a0, a0
        li a7, 1
        ecall

    _end:
        li a0, 0
        li a7, 93
        ecall

    _pow:
        li t0, 1
        beqz a1, _pow_end
    _pow_loop:
        mul t0, t0, a0
        addi a1, a1, -1
        bnez a1, _pow_loop
    _pow_end:
        mv a0, t0
        ret