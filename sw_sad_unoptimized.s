	.file	"sw_sad_unoptimized.c"
	.text
	.globl	SAD
	.def	SAD;	.scl	2;	.type	32;	.endef
	.seh_proc	SAD
SAD:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movl	%r9d, 40(%rbp)
	movl	$0, -8(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L2
.L6:
	movl	$0, -16(%rbp)
	jmp	.L3
.L5:
	movl	32(%rbp), %edx
	movl	-12(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$6, %rax
	movq	%rax, %rdx
	movq	16(%rbp), %rax
	addq	%rax, %rdx
	movl	40(%rbp), %ecx
	movl	-16(%rbp), %eax
	addl	%ecx, %eax
	cltq
	movl	(%rdx,%rax,4), %edx
	movl	32(%rbp), %ecx
	movl	48(%rbp), %eax
	addl	%eax, %ecx
	movl	-12(%rbp), %eax
	addl	%ecx, %eax
	cltq
	salq	$6, %rax
	movq	%rax, %rcx
	movq	24(%rbp), %rax
	addq	%rax, %rcx
	movl	40(%rbp), %r8d
	movl	56(%rbp), %eax
	addl	%eax, %r8d
	movl	-16(%rbp), %eax
	addl	%r8d, %eax
	cltq
	movl	(%rcx,%rax,4), %eax
	subl	%eax, %edx
	movl	%edx, -4(%rbp)
	cmpl	$0, -4(%rbp)
	jns	.L4
	movl	$0, -4(%rbp)
.L4:
	movl	-4(%rbp), %eax
	addl	%eax, -8(%rbp)
	addl	$1, -16(%rbp)
.L3:
	cmpl	$15, -16(%rbp)
	jle	.L5
	addl	$1, -12(%rbp)
.L2:
	cmpl	$15, -12(%rbp)
	jle	.L6
	movl	-8(%rbp), %eax
	cmpl	64(%rbp), %eax
	jge	.L7
	movl	-8(%rbp), %eax
	movl	%eax, 64(%rbp)
.L7:
	movl	64(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (Rev6, Built by MSYS2 project) 13.1.0"
