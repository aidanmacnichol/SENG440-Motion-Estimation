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
	.file	"hw_sad_reentrant.c"
	.text
	.align	2
	.global	hw_sad_reentrant
	.type	hw_sad_reentrant, %function
hw_sad_reentrant:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 104
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #108
	str	r0, [fp, #-96]
	str	r1, [fp, #-100]
	str	r2, [fp, #-104]
	ldr	r3, [fp, #-96]
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-60]
	vld1.8	{d16-d17}, [r3]
	vstr	d16, [fp, #-92]
	vstr	d17, [fp, #-84]
	ldr	r3, [fp, #-100]
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-56]
	vld1.8	{d16-d17}, [r3]
	vstr	d16, [fp, #-76]
	vstr	d17, [fp, #-68]
	ldr	r3, [fp, #-104]
	vldmia	r3, {d16-d17}
	vstr	d16, [fp, #-20]
	vstr	d17, [fp, #-12]
	vldr	d16, [fp, #-92]
	vldr	d17, [fp, #-84]
	vstr	d16, [fp, #-36]
	vstr	d17, [fp, #-28]
	vldr	d22, [fp, #-76]
	vldr	d23, [fp, #-68]
	vstr	d22, [fp, #-52]
	vstr	d23, [fp, #-44]
	vldr	d20, [fp, #-20]
	vldr	d21, [fp, #-12]
	vldr	d18, [fp, #-36]
	vldr	d19, [fp, #-28]
	vldr	d16, [fp, #-52]
	vldr	d17, [fp, #-44]
	vmov	q11, q10  @ v16qi
	vaba.u8	q11, q9, q8
	vmov	q8, q11  @ v16qi
	ldr	r3, [fp, #-104]
	vstmia	r3, {d16-d17}
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	hw_sad_reentrant, .-hw_sad_reentrant
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
