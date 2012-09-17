	.file	"data.c"
	.section	.rodata
.LC0:
	.string	"ERROR: %s\n"
	.align 4
.LC1:
	.string	"Not enough memory to initialize data buffer"
	.text
	.globl	data_init
	.type	data_init, @function
data_init:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	$512, 8(%eax)
	movl	8(%ebp), %eax
	movl	$0, 4(%eax)
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	sall	$2, %eax
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
	.size	data_init, .-data_init
	.section	.rodata
	.align 4
.LC2:
	.string	"Not enough memory for data buffer overflow"
	.text
	.globl	data_pushline
	.type	data_pushline, @function
data_pushline:
.LFB1:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	%eax, %edx
	jb	.L5
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	leal	512(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 8(%eax)
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	leal	0(,%eax,4), %edx
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
	movl	4(%eax), %eax
	sall	$2, %eax
	addl	%eax, %edx
	movl	12(%ebp), %eax
	movl	%eax, (%edx)
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 4(%eax)
	movl	$1, %eax
.L7:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	data_pushline, .-data_pushline
	.globl	data_shrink
	.type	data_shrink, @function
data_shrink:
.LFB2:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 8(%eax)
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	realloc
	movl	8(%ebp), %edx
	movl	%eax, (%edx)
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	data_shrink, .-data_shrink
	.section	.rodata
	.align 4
.LC3:
	.string	"Unable to obtain full line from buffer"
	.align 4
.LC4:
	.string	"Unable to push new line in data buffer"
	.align 4
.LC5:
	.string	"Unable to push char into line buffer"
	.text
	.globl	accumulate_lines
	.type	accumulate_lines, @function
accumulate_lines:
.LFB3:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	fgetc
	movl	%eax, -24(%ebp)
	jmp	.L10
.L18:
	movl	-24(%ebp), %eax
	movb	%al, -9(%ebp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	feof
	testl	%eax, %eax
	jne	.L11
	cmpb	$10, -9(%ebp)
	je	.L12
.L11:
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	feof
	testl	%eax, %eax
	je	.L13
	movl	16(%ebp), %eax
	movl	%eax, (%esp)
	call	buffer_pending
	testl	%eax, %eax
	je	.L13
.L12:
	movl	16(%ebp), %eax
	movl	%eax, (%esp)
	call	buffer_reset
	movl	%eax, -16(%ebp)
	cmpl	$0, -16(%ebp)
	jne	.L14
	movl	$.LC0, %edx
	movl	stderr, %eax
	movl	$.LC3, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	movl	$0, %eax
	jmp	.L15
.L14:
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	data_pushline
	movl	%eax, -20(%ebp)
	cmpl	$0, -20(%ebp)
	jne	.L17
	movl	$.LC0, %edx
	movl	stderr, %eax
	movl	$.LC4, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	movl	$0, %eax
	jmp	.L15
.L13:
	movsbl	-9(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	16(%ebp), %eax
	movl	%eax, (%esp)
	call	buffer_push
	movl	%eax, -20(%ebp)
	cmpl	$0, -20(%ebp)
	jne	.L17
	movl	$.LC0, %edx
	movl	stderr, %eax
	movl	$.LC5, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	movl	$0, %eax
	jmp	.L15
.L17:
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	fgetc
	movl	%eax, -24(%ebp)
.L10:
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	feof
	testl	%eax, %eax
	je	.L18
	movl	16(%ebp), %eax
	movl	%eax, (%esp)
	call	buffer_pending
	testl	%eax, %eax
	jne	.L18
	movl	$1, %eax
.L15:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	accumulate_lines, .-accumulate_lines
	.section	.rodata
	.align 4
.LC6:
	.string	"Unable to initialize line buffer"
.LC7:
	.string	"r"
.LC8:
	.string	"Unable to open file %s\n"
	.align 4
.LC9:
	.string	"Unable to accumulate lines from multiple files"
	.align 4
.LC10:
	.string	"Unable to accumulate lines from file"
	.text
	.globl	data_read
	.type	data_read, @function
data_read:
.LFB4:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	leal	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	buffer_init
	movl	%eax, -16(%ebp)
	cmpl	$0, -16(%ebp)
	jne	.L20
	movl	$.LC0, %edx
	movl	stderr, %eax
	movl	$.LC6, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	movl	$0, %eax
	jmp	.L21
.L20:
	movl	12(%ebp), %eax
	movl	20(%eax), %eax
	testl	%eax, %eax
	je	.L22
	movl	$0, -20(%ebp)
	jmp	.L23
.L26:
	movl	$.LC7, %edx
	movl	12(%ebp), %eax
	movl	16(%eax), %eax
	movl	-20(%ebp), %ecx
	sall	$2, %ecx
	addl	%ecx, %eax
	movl	(%eax), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fopen
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	jne	.L24
	movl	12(%ebp), %eax
	movl	16(%eax), %eax
	movl	-20(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %edx
	movl	$.LC8, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	printf
	leal	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	buffer_cleanup
	movl	$0, %eax
	jmp	.L21
.L24:
	leal	-32(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	accumulate_lines
	movl	%eax, -16(%ebp)
	cmpl	$0, -16(%ebp)
	jne	.L25
	movl	$.LC0, %edx
	movl	stderr, %eax
	movl	$.LC9, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	fclose
	leal	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	buffer_cleanup
	movl	$0, %eax
	jmp	.L21
.L25:
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	fclose
	addl	$1, -20(%ebp)
.L23:
	movl	12(%ebp), %eax
	movl	20(%eax), %eax
	cmpl	-20(%ebp), %eax
	jg	.L26
	jmp	.L27
.L22:
	movl	stdin, %eax
	leal	-32(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	accumulate_lines
	movl	%eax, -16(%ebp)
	cmpl	$0, -16(%ebp)
	jne	.L27
	movl	$.LC0, %edx
	movl	stderr, %eax
	movl	$.LC10, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	leal	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	buffer_cleanup
	movl	$0, %eax
	jmp	.L21
.L27:
	leal	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	buffer_cleanup
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	data_shrink
	movl	$1, %eax
.L21:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE4:
	.size	data_read, .-data_read
	.globl	data_display
	.type	data_display, @function
data_display:
.LFB5:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	jmp	.L29
.L30:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-12(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	puts
	addl	$1, -12(%ebp)
.L29:
	movl	-12(%ebp), %edx
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	%eax, %edx
	jb	.L30
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE5:
	.size	data_display, .-data_display
	.globl	data_cleanup
	.type	data_cleanup, @function
data_cleanup:
.LFB6:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	jmp	.L32
.L33:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-12(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	free
	addl	$1, -12(%ebp)
.L32:
	movl	-12(%ebp), %edx
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	%eax, %edx
	jb	.L33
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	free
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE6:
	.size	data_cleanup, .-data_cleanup
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
