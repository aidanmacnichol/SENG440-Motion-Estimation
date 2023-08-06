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
	.global	neon_sad_block_8x8
	.type	neon_sad_block_8x8, %function
neon_sad_block_8x8:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 536
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #540
	str	r0, [fp, #-536]
	str	r1, [fp, #-540]
	mov	r3, #0
	str	r3, [fp, #-468]
	mov	r3, #0
	str	r3, [fp, #-464]
	b	.L2
.L3:
	ldr	r3, [fp, #-464]
	mov	r3, r3, asl #4
	mov	r2, r3
	ldr	r3, [fp, #-536]
	add	r3, r3, r2
	str	r3, [fp, #-396]
	ldr	r3, [fp, #-396]
	vld1.8	{d16-d17}, [r3]
	vstr	d16, [fp, #-460]
	vstr	d17, [fp, #-452]
	ldr	r3, [fp, #-464]
	mov	r3, r3, asl #4
	mov	r2, r3
	ldr	r3, [fp, #-540]
	add	r3, r3, r2
	str	r3, [fp, #-392]
	ldr	r3, [fp, #-392]
	vld1.8	{d16-d17}, [r3]
	vstr	d16, [fp, #-444]
	vstr	d17, [fp, #-436]
	vldr	d16, [fp, #-460]
	vldr	d17, [fp, #-452]
	vstr	d16, [fp, #-372]
	vstr	d17, [fp, #-364]
	vldr	d16, [fp, #-444]
	vldr	d17, [fp, #-436]
	vstr	d16, [fp, #-388]
	vstr	d17, [fp, #-380]
	vldr	d18, [fp, #-372]
	vldr	d19, [fp, #-364]
	vldr	d16, [fp, #-388]
	vldr	d17, [fp, #-380]
	vabd.u8	q8, q9, q8
	vstr	d16, [fp, #-532]
	vstr	d17, [fp, #-524]
	vldr	d16, [fp, #-460]
	vldr	d17, [fp, #-452]
	vstr	d16, [fp, #-340]
	vstr	d17, [fp, #-332]
	vldr	d16, [fp, #-444]
	vldr	d17, [fp, #-436]
	vstr	d16, [fp, #-356]
	vstr	d17, [fp, #-348]
	vldr	d18, [fp, #-340]
	vldr	d19, [fp, #-332]
	vldr	d16, [fp, #-356]
	vldr	d17, [fp, #-348]
	vabd.u8	q8, q9, q8
	vstr	d16, [fp, #-516]
	vstr	d17, [fp, #-508]
	vldr	d16, [fp, #-460]
	vldr	d17, [fp, #-452]
	vstr	d16, [fp, #-308]
	vstr	d17, [fp, #-300]
	vldr	d16, [fp, #-444]
	vldr	d17, [fp, #-436]
	vstr	d16, [fp, #-324]
	vstr	d17, [fp, #-316]
	vldr	d18, [fp, #-308]
	vldr	d19, [fp, #-300]
	vldr	d16, [fp, #-324]
	vldr	d17, [fp, #-316]
	vabd.u8	q8, q9, q8
	vstr	d16, [fp, #-500]
	vstr	d17, [fp, #-492]
	vldr	d16, [fp, #-460]
	vldr	d17, [fp, #-452]
	vstr	d16, [fp, #-276]
	vstr	d17, [fp, #-268]
	vldr	d16, [fp, #-444]
	vldr	d17, [fp, #-436]
	vstr	d16, [fp, #-292]
	vstr	d17, [fp, #-284]
	vldr	d18, [fp, #-276]
	vldr	d19, [fp, #-268]
	vldr	d16, [fp, #-292]
	vldr	d17, [fp, #-284]
	vabd.u8	q8, q9, q8
	vstr	d16, [fp, #-484]
	vstr	d17, [fp, #-476]
	vldr	d16, [fp, #-532]
	vldr	d17, [fp, #-524]
	vstr	d16, [fp, #-244]
	vstr	d17, [fp, #-236]
	vldr	d16, [fp, #-516]
	vldr	d17, [fp, #-508]
	vstr	d16, [fp, #-260]
	vstr	d17, [fp, #-252]
	vldr	d18, [fp, #-244]
	vldr	d19, [fp, #-236]
	vldr	d16, [fp, #-260]
	vldr	d17, [fp, #-252]
	vadd.i8	q8, q9, q8
	vmov	q10, q8  @ v16qi
	vldr	d16, [fp, #-500]
	vldr	d17, [fp, #-492]
	vstr	d16, [fp, #-212]
	vstr	d17, [fp, #-204]
	vldr	d16, [fp, #-484]
	vldr	d17, [fp, #-476]
	vstr	d16, [fp, #-228]
	vstr	d17, [fp, #-220]
	vldr	d18, [fp, #-212]
	vldr	d19, [fp, #-204]
	vldr	d16, [fp, #-228]
	vldr	d17, [fp, #-220]
	vadd.i8	q8, q9, q8
	vstr	d20, [fp, #-180]
	vstr	d21, [fp, #-172]
	vstr	d16, [fp, #-196]
	vstr	d17, [fp, #-188]
	vldr	d18, [fp, #-180]
	vldr	d19, [fp, #-172]
	vldr	d16, [fp, #-196]
	vldr	d17, [fp, #-188]
	vadd.i8	q8, q9, q8
	vstr	d16, [fp, #-428]
	vstr	d17, [fp, #-420]
	vldr	d16, [fp, #-428]
	vldr	d17, [fp, #-420]
	vstr	d16, [fp, #-164]
	vstr	d17, [fp, #-156]
	vldr	d16, [fp, #-164]
	vldr	d17, [fp, #-156]
	fstd	d16, [fp, #-412]
	vldr	d16, [fp, #-428]
	vldr	d17, [fp, #-420]
	vstr	d16, [fp, #-148]
	vstr	d17, [fp, #-140]
	vldr	d16, [fp, #-148]
	vldr	d17, [fp, #-140]
	vmov	d16, d17
	fstd	d16, [fp, #-404]
	fldd	d17, [fp, #-412]
	fstd	d17, [fp, #-132]
	fldd	d16, [fp, #-132]
	vmov.u8	r3, d16[0]
	and	r3, r3, #255
	mov	r2, r3
	fldd	d16, [fp, #-412]
	fstd	d16, [fp, #-124]
	fldd	d16, [fp, #-124]
	vmov.u8	r3, d16[1]
	and	r3, r3, #255
	add	r2, r2, r3
	fldd	d17, [fp, #-412]
	fstd	d17, [fp, #-116]
	fldd	d16, [fp, #-116]
	vmov.u8	r3, d16[2]
	and	r3, r3, #255
	add	r2, r2, r3
	fldd	d16, [fp, #-412]
	fstd	d16, [fp, #-108]
	fldd	d16, [fp, #-108]
	vmov.u8	r3, d16[3]
	and	r3, r3, #255
	add	r2, r2, r3
	fldd	d17, [fp, #-412]
	fstd	d17, [fp, #-100]
	fldd	d16, [fp, #-100]
	vmov.u8	r3, d16[4]
	and	r3, r3, #255
	add	r2, r2, r3
	fldd	d16, [fp, #-412]
	fstd	d16, [fp, #-92]
	fldd	d16, [fp, #-92]
	vmov.u8	r3, d16[5]
	and	r3, r3, #255
	add	r2, r2, r3
	fldd	d17, [fp, #-412]
	fstd	d17, [fp, #-84]
	fldd	d16, [fp, #-84]
	vmov.u8	r3, d16[6]
	and	r3, r3, #255
	add	r2, r2, r3
	fldd	d16, [fp, #-412]
	fstd	d16, [fp, #-76]
	fldd	d16, [fp, #-76]
	vmov.u8	r3, d16[7]
	and	r3, r3, #255
	add	r2, r2, r3
	fldd	d17, [fp, #-404]
	fstd	d17, [fp, #-68]
	fldd	d16, [fp, #-68]
	vmov.u8	r3, d16[0]
	and	r3, r3, #255
	add	r2, r2, r3
	fldd	d16, [fp, #-404]
	fstd	d16, [fp, #-60]
	fldd	d16, [fp, #-60]
	vmov.u8	r3, d16[1]
	and	r3, r3, #255
	add	r2, r2, r3
	fldd	d17, [fp, #-404]
	fstd	d17, [fp, #-52]
	fldd	d16, [fp, #-52]
	vmov.u8	r3, d16[2]
	and	r3, r3, #255
	add	r2, r2, r3
	fldd	d16, [fp, #-404]
	fstd	d16, [fp, #-44]
	fldd	d16, [fp, #-44]
	vmov.u8	r3, d16[3]
	and	r3, r3, #255
	add	r2, r2, r3
	fldd	d17, [fp, #-404]
	fstd	d17, [fp, #-36]
	fldd	d16, [fp, #-36]
	vmov.u8	r3, d16[4]
	and	r3, r3, #255
	add	r2, r2, r3
	fldd	d16, [fp, #-404]
	fstd	d16, [fp, #-28]
	fldd	d16, [fp, #-28]
	vmov.u8	r3, d16[5]
	and	r3, r3, #255
	add	r2, r2, r3
	fldd	d17, [fp, #-404]
	fstd	d17, [fp, #-20]
	fldd	d16, [fp, #-20]
	vmov.u8	r3, d16[6]
	and	r3, r3, #255
	add	r2, r2, r3
	fldd	d16, [fp, #-404]
	fstd	d16, [fp, #-12]
	fldd	d16, [fp, #-12]
	vmov.u8	r3, d16[7]
	and	r3, r3, #255
	add	r2, r2, r3
	ldr	r3, [fp, #-468]
	add	r3, r3, r2
	str	r3, [fp, #-468]
	ldr	r3, [fp, #-464]
	add	r3, r3, #1
	str	r3, [fp, #-464]
.L2:
	ldr	r3, [fp, #-464]
	cmp	r3, #3
	ble	.L3
	ldr	r3, [fp, #-468]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	neon_sad_block_8x8, .-neon_sad_block_8x8
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
