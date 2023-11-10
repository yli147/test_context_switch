# See LICENSE for license details.

.section .text.init,"ax",@progbits
.globl _start

_start:
    li	t0, SYS_INIT_SP_ADDR
    and	t0, t0, -16		/* force 16 byte alignment */
    mv	sp, t0
    j   main
