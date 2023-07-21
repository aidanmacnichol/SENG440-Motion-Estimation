	.file	"sw_sad_loop_unrolled.c"
	.text
	.globl	SAD_unrolled
	.def	SAD_unrolled;	.scl	2;	.type	32;	.endef
	.seh_proc	SAD_unrolled
SAD_unrolled:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movl	%r9d, 40(%rbp)
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L2
.L9:
	movl	$0, -12(%rbp)
	jmp	.L3
.L8:
	movl	32(%rbp), %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$6, %rax
	movq	%rax, %rdx
	movq	16(%rbp), %rax
	addq	%rax, %rdx
	movl	40(%rbp), %ecx
	movl	-12(%rbp), %eax
	addl	%ecx, %eax
	cltq
	movl	(%rdx,%rax,4), %edx
	movl	32(%rbp), %ecx
	movl	48(%rbp), %eax
	addl	%eax, %ecx
	movl	-8(%rbp), %eax
	addl	%ecx, %eax
	cltq
	salq	$6, %rax
	movq	%rax, %rcx
	movq	24(%rbp), %rax
	addq	%rax, %rcx
	movl	40(%rbp), %r8d
	movl	56(%rbp), %eax
	addl	%eax, %r8d
	movl	-12(%rbp), %eax
	addl	%r8d, %eax
	cltq
	movl	(%rcx,%rax,4), %eax
	subl	%eax, %edx
	movl	%edx, -16(%rbp)
	movl	32(%rbp), %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$6, %rax
	movq	%rax, %rdx
	movq	16(%rbp), %rax
	addq	%rax, %rdx
	movl	40(%rbp), %ecx
	movl	-12(%rbp), %eax
	addl	%ecx, %eax
	addl	$1, %eax
	cltq
	movl	(%rdx,%rax,4), %edx
	movl	32(%rbp), %ecx
	movl	48(%rbp), %eax
	addl	%eax, %ecx
	movl	-8(%rbp), %eax
	addl	%ecx, %eax
	cltq
	salq	$6, %rax
	movq	%rax, %rcx
	movq	24(%rbp), %rax
	addq	%rax, %rcx
	movl	40(%rbp), %r8d
	movl	56(%rbp), %eax
	addl	%eax, %r8d
	movl	-12(%rbp), %eax
	addl	%r8d, %eax
	addl	$1, %eax
	cltq
	movl	(%rcx,%rax,4), %eax
	subl	%eax, %edx
	movl	%edx, -20(%rbp)
	cmpl	$0, -16(%rbp)
	jns	.L4
	movl	-16(%rbp), %eax
	subl	%eax, -4(%rbp)
	jmp	.L5
.L4:
	movl	-16(%rbp), %eax
	addl	%eax, -4(%rbp)
.L5:
	cmpl	$0, -20(%rbp)
	jns	.L6
	movl	$0, -20(%rbp)
	jmp	.L7
.L6:
	movl	-20(%rbp), %eax
	addl	%eax, -4(%rbp)
.L7:
	addl	$2, -12(%rbp)
.L3:
	cmpl	$15, -12(%rbp)
	jle	.L8
	addl	$1, -8(%rbp)
.L2:
	cmpl	$15, -8(%rbp)
	jle	.L9
	movl	-4(%rbp), %eax
	cmpl	64(%rbp), %eax
	jge	.L10
	movl	-4(%rbp), %eax
	movl	%eax, 64(%rbp)
.L10:
	movl	64(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (Rev6, Built by MSYS2 project) 13.1.0"
