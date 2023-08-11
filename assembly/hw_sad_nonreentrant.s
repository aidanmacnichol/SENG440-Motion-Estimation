	.arch armv4t
	.eabi_attribute 27, 3
	.fpu neon
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"hw_sad_nonreentrant.c"
	.text
	.align	2
	.global	hw_sad_nonreentrant
	.type	hw_sad_nonreentrant, %function
hw_sad_nonreentrant:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 224
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #228
	str	r0, [fp, #-224]
	str	r1, [fp, #-228]
	ldr	r3, [fp, #-224]
	str	r3, [fp, #-124]
	ldr	r3, [fp, #-124]
	vld1.8	{d16-d17}, [r3]
	vstr	d16, [fp, #-204]
	vstr	d17, [fp, #-196]
	ldr	r3, [fp, #-228]
	str	r3, [fp, #-120]
	ldr	r3, [fp, #-120]
	vld1.8	{d16-d17}, [r3]
	vstr	d16, [fp, #-188]
	vstr	d17, [fp, #-180]
	vldr	d16, [fp, #-204]
	vldr	d17, [fp, #-196]
	vstr	d16, [fp, #-100]
	vstr	d17, [fp, #-92]
	vldr	d16, [fp, #-188]
	vldr	d17, [fp, #-180]
	vstr	d16, [fp, #-116]
	vstr	d17, [fp, #-108]
	vldr	d18, [fp, #-100]
	vldr	d19, [fp, #-92]
	vldr	d16, [fp, #-116]
	vldr	d17, [fp, #-108]
	vabd.u8	q8, q9, q8
	vstr	d16, [fp, #-220]
	vstr	d17, [fp, #-212]
	vldr	d16, [fp, #-220]
	vldr	d17, [fp, #-212]
	vstr	d16, [fp, #-84]
	vstr	d17, [fp, #-76]
	vldr	d16, [fp, #-84]
	vldr	d17, [fp, #-76]
	fstd	d16, [fp, #-172]
	vldr	d16, [fp, #-220]
	vldr	d17, [fp, #-212]
	vstr	d16, [fp, #-68]
	vstr	d17, [fp, #-60]
	vldr	d16, [fp, #-68]
	vldr	d17, [fp, #-60]
	vmov	d16, d17
	fstd	d16, [fp, #-164]
	fldd	d17, [fp, #-172]
	fstd	d17, [fp, #-44]
	fldd	d16, [fp, #-164]
	fstd	d16, [fp, #-52]
	fldd	d17, [fp, #-44]
	fldd	d16, [fp, #-52]
	vadd.i8	d16, d17, d16
	fstd	d16, [fp, #-156]
	fldd	d17, [fp, #-156]
	fstd	d17, [fp, #-36]
	fldd	d16, [fp, #-36]
	vpaddl.u8	d16, d16
	fstd	d16, [fp, #-148]
	fldd	d16, [fp, #-148]
	fstd	d16, [fp, #-28]
	fldd	d16, [fp, #-28]
	vpaddl.u16	d16, d16
	fstd	d16, [fp, #-140]
	fldd	d17, [fp, #-140]
	fstd	d17, [fp, #-20]
	fldd	d16, [fp, #-20]
	vmov.32	r3, d16[0]
	mov	r2, r3
	fldd	d16, [fp, #-140]
	fstd	d16, [fp, #-12]
	fldd	d16, [fp, #-12]
	vmov.32	r3, d16[1]
	add	r3, r2, r3
	str	r3, [fp, #-128]
	ldr	r3, [fp, #-128]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	hw_sad_nonreentrant, .-hw_sad_nonreentrant
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
