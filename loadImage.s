	.file	"loadImage.c"
	.text
	.def	fscanf;	.scl	3;	.type	32;	.endef
	.seh_proc	fscanf
fscanf:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	leaq	32(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	__mingw_vfscanf
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	printf;	.scl	3;	.type	32;	.endef
	.seh_proc	printf
printf:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	48(%rsp), %rbp
	.seh_setframe	%rbp, 48
	.seh_endprologue
	movq	%rcx, 32(%rbp)
	movq	%rdx, 40(%rbp)
	movq	%r8, 48(%rbp)
	movq	%r9, 56(%rbp)
	leaq	40(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rbx
	movl	$1, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	32(%rbp), %rax
	movq	%rbx, %r8
	movq	%rax, %rdx
	call	__mingw_vfprintf
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
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
	jmp	.L6
.L10:
	movl	$0, -16(%rbp)
	jmp	.L7
.L9:
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
	jns	.L8
	movl	$0, -4(%rbp)
.L8:
	movl	-4(%rbp), %eax
	addl	%eax, -8(%rbp)
	addl	$1, -16(%rbp)
.L7:
	cmpl	$15, -16(%rbp)
	jle	.L9
	addl	$1, -12(%rbp)
.L6:
	cmpl	$15, -12(%rbp)
	jle	.L10
	movl	-8(%rbp), %eax
	cmpl	64(%rbp), %eax
	jge	.L11
	movl	-8(%rbp), %eax
	movl	%eax, 64(%rbp)
.L11:
	movl	64(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
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
	jmp	.L14
.L21:
	movl	$0, -12(%rbp)
	jmp	.L15
.L20:
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
	jns	.L16
	movl	-16(%rbp), %eax
	subl	%eax, -4(%rbp)
	jmp	.L17
.L16:
	movl	-16(%rbp), %eax
	addl	%eax, -4(%rbp)
.L17:
	cmpl	$0, -20(%rbp)
	jns	.L18
	movl	$0, -20(%rbp)
	jmp	.L19
.L18:
	movl	-20(%rbp), %eax
	addl	%eax, -4(%rbp)
.L19:
	addl	$2, -12(%rbp)
.L15:
	cmpl	$15, -12(%rbp)
	jle	.L20
	addl	$1, -8(%rbp)
.L14:
	cmpl	$15, -8(%rbp)
	jle	.L21
	movl	-4(%rbp), %eax
	cmpl	64(%rbp), %eax
	jge	.L22
	movl	-4(%rbp), %eax
	movl	%eax, 64(%rbp)
.L22:
	movl	64(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC0:
	.ascii "r\0"
.LC1:
	.ascii "Error opening file: %s\12\0"
.LC2:
	.ascii "%d\0"
	.text
	.globl	loadImage
	.def	loadImage;	.scl	2;	.type	32;	.endef
	.seh_proc	loadImage
loadImage:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	24(%rbp), %rax
	leaq	.LC0(%rip), %rdx
	movq	%rax, %rcx
	call	fopen
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L25
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rcx
	call	printf
	jmp	.L24
.L25:
	movl	$0, -4(%rbp)
	jmp	.L27
.L30:
	movl	$0, -8(%rbp)
	jmp	.L28
.L29:
	movl	-8(%rbp), %eax
	movslq	%eax, %rcx
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$4, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rdx
	movq	16(%rbp), %rax
	addq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %r8
	leaq	.LC2(%rip), %rdx
	movq	%rax, %rcx
	call	fscanf
	addl	$1, -8(%rbp)
.L28:
	cmpl	$239, -8(%rbp)
	jle	.L29
	addl	$1, -4(%rbp)
.L27:
	cmpl	$319, -4(%rbp)
	jle	.L30
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	nop
.L24:
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC3:
	.ascii "%d \0"
.LC4:
	.ascii "\12\0"
	.text
	.globl	printArray
	.def	printArray;	.scl	2;	.type	32;	.endef
	.seh_proc	printArray
printArray:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L32
.L35:
	movl	$0, -8(%rbp)
	jmp	.L33
.L34:
	movq	16(%rbp), %rcx
	movl	-8(%rbp), %eax
	movslq	%eax, %r8
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$4, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%r8, %rax
	movl	(%rcx,%rax,4), %eax
	movl	%eax, %edx
	leaq	.LC3(%rip), %rax
	movq	%rax, %rcx
	call	printf
	addl	$1, -8(%rbp)
.L33:
	cmpl	$239, -8(%rbp)
	jle	.L34
	leaq	.LC4(%rip), %rax
	movq	%rax, %rcx
	call	printf
	addl	$1, -4(%rbp)
.L32:
	cmpl	$319, -4(%rbp)
	jle	.L35
	nop
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC5:
	.ascii "reference.txt\0"
.LC6:
	.ascii "forward.txt\0"
.LC7:
	.ascii "Best Match: %d\12\0"
	.align 8
.LC9:
	.ascii "Execution Time - unoptimized SAD: %f\12\0"
	.align 8
.LC10:
	.ascii "Execution Time - unrolled SAD: %f\12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movl	$616576, %eax
	call	___chkstk_ms
	subq	%rax, %rsp
	.seh_stackalloc	616576
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	call	__main
	movl	$200, 616428(%rbp)
	leaq	307136(%rbp), %rax
	leaq	.LC5(%rip), %rdx
	movq	%rax, %rcx
	call	loadImage
	leaq	-64(%rbp), %rax
	leaq	.LC6(%rip), %rdx
	movq	%rax, %rcx
	call	loadImage
	movl	$0, 616444(%rbp)
	jmp	.L37
.L40:
	movl	$0, 616440(%rbp)
	jmp	.L38
.L39:
	movl	616440(%rbp), %eax
	movslq	%eax, %rcx
	movl	616444(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$4, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movl	307136(%rbp,%rax,4), %eax
	movl	616440(%rbp), %edx
	movslq	%edx, %rdx
	movl	616444(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$4, %rcx
	addq	%rcx, %rdx
	movl	%eax, 614336(%rbp,%rdx,4)
	addl	$1, 616440(%rbp)
.L38:
	cmpl	$15, 616440(%rbp)
	jle	.L39
	addl	$1, 616444(%rbp)
.L37:
	cmpl	$15, 616444(%rbp)
	jle	.L40
	call	clock
	movl	%eax, 616424(%rbp)
	movl	$1, 616436(%rbp)
	jmp	.L41
.L48:
	movl	$1, 616432(%rbp)
	jmp	.L42
.L47:
	movl	$0, 616444(%rbp)
	jmp	.L43
.L46:
	movl	$0, 616440(%rbp)
	jmp	.L44
.L45:
	movl	616440(%rbp), %eax
	movslq	%eax, %rcx
	movl	616444(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$4, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movl	-64(%rbp,%rax,4), %eax
	movl	616440(%rbp), %edx
	movslq	%edx, %rdx
	movl	616444(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$4, %rcx
	addq	%rcx, %rdx
	movl	%eax, 615360(%rbp,%rdx,4)
	addl	$1, 616440(%rbp)
.L44:
	cmpl	$15, 616440(%rbp)
	jle	.L45
	addl	$1, 616444(%rbp)
.L43:
	cmpl	$15, 616444(%rbp)
	jle	.L46
	leaq	614336(%rbp), %rdx
	leaq	615360(%rbp), %rax
	movl	616428(%rbp), %ecx
	movl	%ecx, 48(%rsp)
	movl	$0, 40(%rsp)
	movl	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rcx
	call	SAD
	movl	%eax, 616428(%rbp)
	addl	$1, 616432(%rbp)
.L42:
	cmpl	$223, 616432(%rbp)
	jle	.L47
	addl	$1, 616436(%rbp)
.L41:
	cmpl	$303, 616436(%rbp)
	jle	.L48
	movl	616428(%rbp), %eax
	movl	%eax, %edx
	leaq	.LC7(%rip), %rax
	movq	%rax, %rcx
	call	printf
	call	clock
	movl	%eax, 616420(%rbp)
	movl	616420(%rbp), %eax
	subl	616424(%rbp), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movsd	.LC8(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, 616408(%rbp)
	movsd	616408(%rbp), %xmm0
	movq	616408(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %rdx
	leaq	.LC9(%rip), %rax
	movq	%rax, %rcx
	call	printf
	call	clock
	movl	%eax, 616404(%rbp)
	movl	$1, 616436(%rbp)
	jmp	.L49
.L56:
	movl	$1, 616432(%rbp)
	jmp	.L50
.L55:
	movl	$0, 616444(%rbp)
	jmp	.L51
.L54:
	movl	$0, 616440(%rbp)
	jmp	.L52
.L53:
	movl	616440(%rbp), %eax
	movslq	%eax, %rcx
	movl	616444(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$4, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movl	-64(%rbp,%rax,4), %eax
	movl	616440(%rbp), %edx
	movslq	%edx, %rdx
	movl	616444(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$4, %rcx
	addq	%rcx, %rdx
	movl	%eax, 615360(%rbp,%rdx,4)
	addl	$1, 616440(%rbp)
.L52:
	cmpl	$15, 616440(%rbp)
	jle	.L53
	addl	$1, 616444(%rbp)
.L51:
	cmpl	$15, 616444(%rbp)
	jle	.L54
	leaq	614336(%rbp), %rdx
	leaq	615360(%rbp), %rax
	movl	616428(%rbp), %ecx
	movl	%ecx, 48(%rsp)
	movl	$0, 40(%rsp)
	movl	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rcx
	call	SAD_unrolled
	movl	%eax, 616428(%rbp)
	addl	$1, 616432(%rbp)
.L50:
	cmpl	$223, 616432(%rbp)
	jle	.L55
	addl	$1, 616436(%rbp)
.L49:
	cmpl	$303, 616436(%rbp)
	jle	.L56
	call	clock
	movl	%eax, 616400(%rbp)
	movl	616400(%rbp), %eax
	subl	616404(%rbp), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movsd	.LC8(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, 616392(%rbp)
	movsd	616392(%rbp), %xmm0
	movq	616392(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %rdx
	leaq	.LC10(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$0, %eax
	addq	$616576, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC8:
	.long	0
	.long	1083129856
	.ident	"GCC: (Rev6, Built by MSYS2 project) 13.1.0"
	.def	__mingw_vfscanf;	.scl	2;	.type	32;	.endef
	.def	__mingw_vfprintf;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	clock;	.scl	2;	.type	32;	.endef
