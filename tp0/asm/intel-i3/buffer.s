	.file	"buffer.c"
	.section	.rodata
.LC0:
	.string	"ERROR: %s\n"
	.align 4
.LC1:
	.string	"Not enough memory to initialize line buffer"
	.text
	.globl	buffer_init
	.type	buffer_init, @function
buffer_init:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	$32, 4(%eax)
	movl	8(%ebp), %eax
	movl	$0, 8(%eax)
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, (%esp)
	call	malloc
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	.L2
	movl	$.LC0, %edx
	movl	stderr, %eax
	movl	$.LC1, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	movl	$0, %eax
	jmp	.L3
.L2:
	movl	$1, %eax
.L3:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	buffer_init, .-buffer_init
	.section	.rodata
	.align 4
.LC2:
	.string	"Not enough memory for line buffer overflow"
	.text
	.globl	buffer_push
	.type	buffer_push, @function
buffer_push:
.LFB1:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	12(%ebp), %eax
	movb	%al, -28(%ebp)
	movl	8(%ebp), %eax
	movl	8(%eax), %edx
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	%eax, %edx
	jb	.L5
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	leal	32(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 4(%eax)
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	realloc
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	jne	.L6
	movl	$.LC0, %edx
	movl	stderr, %eax
	movl	$.LC2, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	movl	$0, %eax
	jmp	.L7
.L6:
	movl	8(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, (%eax)
.L5:
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	addl	%eax, %edx
	movzbl	-28(%ebp), %eax
	movb	%al, (%edx)
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	leal	1(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 8(%eax)
	movl	$1, %eax
.L7:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	buffer_push, .-buffer_push
	.section	.rodata
	.align 4
.LC3:
	.string	"Not enough memory for line buffer reset"
	.text
	.globl	buffer_reset
	.type	buffer_reset, @function
buffer_reset:
.LFB2:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	addl	$1, %eax
	movl	%eax, (%esp)
	call	malloc
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	jne	.L9
	movl	$.LC0, %edx
	movl	stderr, %eax
	movl	$.LC3, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	movl	$0, %eax
	jmp	.L10
.L9:
	movl	8(%ebp), %eax
	movl	8(%eax), %ecx
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	memcpy
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	addl	-12(%ebp), %eax
	movb	$0, (%eax)
	movl	8(%ebp), %eax
	movl	$0, 8(%eax)
	movl	-12(%ebp), %eax
.L10:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	buffer_reset, .-buffer_reset
	.globl	buffer_pending
	.type	buffer_pending, @function
buffer_pending:
.LFB3:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	popl	%ebp
	.cfi_def_cfa 4, 4
	.cfi_restore 5
	ret
	.cfi_endproc
.LFE3:
	.size	buffer_pending, .-buffer_pending
	.globl	buffer_cleanup
	.type	buffer_cleanup, @function
buffer_cleanup:
.LFB4:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	free
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE4:
	.size	buffer_cleanup, .-buffer_cleanup
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
