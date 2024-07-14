

.text

.globl _start
.globl _vector_table
.globl _freertos_vector_table

.globl FIQInterrupt
.globl IRQInterrupt
.globl SErrorInterrupt
.globl SynchronousInterrupt



.section .vectors, "a"

_vector_table:

.set	VBAR, _vector_table

.org VBAR
	b	_start

.org (VBAR + 0x80)
	b	.

.org (VBAR + 0x100)
	b	.

.org (VBAR + 0x180)
	b	.


.org (VBAR + 0x200)
	b	.

.org (VBAR + 0x280)
	b	.

.org (VBAR + 0x300)
	b	.

.org (VBAR + 0x380)
	b	.



.org (VBAR + 0x400)
	b	.

.org (VBAR + 0x480)
	b	.

.org (VBAR + 0x500)
	b	.

.org (VBAR + 0x580)
	b	.

.org (VBAR + 0x600)
	b	.

.org (VBAR + 0x680)
	b	.

.org (VBAR + 0x700)
	b	.

.org (VBAR + 0x780)
	b	.



/******************************************************************************
 * Vector table to use when FreeRTOS is running.
 *****************************************************************************/
.set	FREERTOS_VBAR, (VBAR+0x1000)

.org(FREERTOS_VBAR)
_freertos_vector_table:
	b	FreeRTOS_SWI_Handler

.org (FREERTOS_VBAR + 0x80)
	b	FreeRTOS_IRQ_Handler

.org (FREERTOS_VBAR + 0x100)
	b	.

.org (FREERTOS_VBAR + 0x180)
	b	.

.org (FREERTOS_VBAR + 0x200)
	b	FreeRTOS_SWI_Handler

.org (FREERTOS_VBAR + 0x280)
	b	FreeRTOS_IRQ_Handler

.org (FREERTOS_VBAR + 0x300)
	b	.

.org (FREERTOS_VBAR + 0x380)
	b	.

.org (FREERTOS_VBAR + 0x400)
	b	.

.org (FREERTOS_VBAR + 0x480)
	b	.

.org (FREERTOS_VBAR + 0x500)
	b	.

.org (FREERTOS_VBAR + 0x580)
	b	.

.org (FREERTOS_VBAR + 0x600)
	b	.

.org (FREERTOS_VBAR + 0x680)
	b	.

.org (FREERTOS_VBAR + 0x700)
	b	.

.org (FREERTOS_VBAR + 0x780)
	b	.

.org (FREERTOS_VBAR + 0x800)



#if 0
SynchronousInterruptHandler:
	stp	X0,X1, [sp,#-0x10]!
	stp	X2,X3, [sp,#-0x10]!
	stp	X4,X5, [sp,#-0x10]!
	stp	X6,X7, [sp,#-0x10]!
	stp	X8,X9, [sp,#-0x10]!
	stp	X10,X11, [sp,#-0x10]!
	stp	X12,X13, [sp,#-0x10]!
	stp	X14,X15, [sp,#-0x10]!
	stp	X16,X17, [sp,#-0x10]!
	stp     X18,X19, [sp,#-0x10]!
	stp     X29,X30, [sp,#-0x10]!

        bl      SynchronousInterrupt

	ldp     X29,X30, [sp], #0x10
        ldp     X18,X19, [sp], #0x10
	ldp	X16,X17, [sp], #0x10
	ldp	X14,X15, [sp], #0x10
	ldp	X12,X13, [sp], #0x10
	ldp	X10,X11, [sp], #0x10
	ldp	X8,X9, [sp], #0x10
	ldp	X6,X7, [sp], #0x10
	ldp	X4,X5, [sp], #0x10
	ldp	X2,X3, [sp], #0x10
	ldp	X0,X1, [sp], #0x10

	eret

IRQInterruptHandler:
	stp	X0,X1, [sp,#-0x10]!
	stp	X2,X3, [sp,#-0x10]!
	stp	X4,X5, [sp,#-0x10]!
	stp	X6,X7, [sp,#-0x10]!
	stp	X8,X9, [sp,#-0x10]!
	stp	X10,X11, [sp,#-0x10]!
	stp	X12,X13, [sp,#-0x10]!
	stp	X14,X15, [sp,#-0x10]!
	stp	X16,X17, [sp,#-0x10]!
	stp     X18,X19, [sp,#-0x10]!
	stp     X29,X30, [sp,#-0x10]!

	bl      IRQInterrupt

	ldp     X29,X30, [sp], #0x10
	ldp     X18,X19, [sp], #0x10
	ldp	X16,X17, [sp], #0x10
	ldp	X14,X15, [sp], #0x10
	ldp	X12,X13, [sp], #0x10
	ldp	X10,X11, [sp], #0x10
	ldp	X8,X9, [sp], #0x10
	ldp	X6,X7, [sp], #0x10
	ldp	X4,X5, [sp], #0x10
	ldp	X2,X3, [sp], #0x10
	ldp	X0,X1, [sp], #0x10

	eret

FIQInterruptHandler:

	stp	X0,X1, [sp,#-0x10]!
	stp	X2,X3, [sp,#-0x10]!
	stp	X4,X5, [sp,#-0x10]!
	stp	X6,X7, [sp,#-0x10]!
	stp	X8,X9, [sp,#-0x10]!
	stp	X10,X11, [sp,#-0x10]!
	stp	X12,X13, [sp,#-0x10]!
	stp	X14,X15, [sp,#-0x10]!
	stp	X16,X17, [sp,#-0x10]!
	stp     X18,X19, [sp,#-0x10]!
	stp     X29,X30, [sp,#-0x10]!

        bl      FIQInterrupt

	ldp     X29,X30, [sp], #0x10
        ldp     X18,X19, [sp], #0x10
	ldp	X16,X17, [sp], #0x10
	ldp	X14,X15, [sp], #0x10
	ldp	X12,X13, [sp], #0x10
	ldp	X10,X11, [sp], #0x10
	ldp	X8,X9, [sp], #0x10
	ldp	X6,X7, [sp], #0x10
	ldp	X4,X5, [sp], #0x10
	ldp	X2,X3, [sp], #0x10
	ldp	X0,X1, [sp], #0x10

	eret

SErrorInterruptHandler:

	stp	X0,X1, [sp,#-0x10]!
	stp	X2,X3, [sp,#-0x10]!
	stp	X4,X5, [sp,#-0x10]!
	stp	X6,X7, [sp,#-0x10]!
	stp	X8,X9, [sp,#-0x10]!
	stp	X10,X11, [sp,#-0x10]!
	stp	X12,X13, [sp,#-0x10]!
	stp	X14,X15, [sp,#-0x10]!
	stp	X16,X17, [sp,#-0x10]!
	stp     X18,X19, [sp,#-0x10]!
	stp     X29,X30, [sp,#-0x10]!

        bl      SErrorInterrupt

	ldp     X29,X30, [sp], #0x10
        ldp     X18,X19, [sp], #0x10
	ldp	X16,X17, [sp], #0x10
	ldp	X14,X15, [sp], #0x10
	ldp	X12,X13, [sp], #0x10
	ldp	X10,X11, [sp], #0x10
	ldp	X8,X9, [sp], #0x10
	ldp	X6,X7, [sp], #0x10
	ldp	X4,X5, [sp], #0x10
	ldp	X2,X3, [sp], #0x10
	ldp	X0,X1, [sp], #0x10

	eret
#endif

.end
