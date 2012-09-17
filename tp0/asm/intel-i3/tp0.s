	.file	"tp0.c"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$64, %esp
	movl	12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	28(%esp), %eax
	movl	%eax, (%esp)
	call	cl_args_parse
	testl	%eax, %eax
	jne	.L2
	movl	$1, %eax
	jmp	.L3
.L2:
	leal	28(%esp), %eax
	movl	%eax, (%esp)
	call	cl_args_validate
	testl	%eax, %eax
	jne	.L4
	call	cl_text_help
	movl	$1, %eax
	jmp	.L3
.L4:
	movl	28(%esp), %eax
	testl	%eax, %eax
	je	.L5
	call	cl_text_help
	movl	$0, %eax
	jmp	.L3
.L5:
	movl	32(%esp), %eax
	testl	%eax, %eax
	je	.L6
	call	cl_text_version
	movl	$0, %eax
	jmp	.L3
.L6:
	leal	52(%esp), %eax
	movl	%eax, (%esp)
	call	data_init
	testl	%eax, %eax
	jne	.L7
	movl	$1, %eax
	jmp	.L3
.L7:
	leal	28(%esp), %eax
	movl	%eax, 4(%esp)
	leal	52(%esp), %eax
	movl	%eax, (%esp)
	call	data_read
	testl	%eax, %eax
	jne	.L8
	leal	52(%esp), %eax
	movl	%eax, (%esp)
	call	data_cleanup
	movl	$1, %eax
	jmp	.L3
.L8:
	movl	40(%esp), %eax
	testl	%eax, %eax
	je	.L9
	movl	56(%esp), %eax
	subl	$1, %eax
	movl	%eax, 8(%esp)
	movl	$0, 4(%esp)
	leal	52(%esp), %eax
	movl	%eax, (%esp)
	call	sort_stooge
	jmp	.L10
.L9:
	movl	56(%esp), %eax
	subl	$1, %eax
	movl	%eax, 8(%esp)
	movl	$0, 4(%esp)
	leal	52(%esp), %eax
	movl	%eax, (%esp)
	call	sort_quicksort
.L10:
	leal	52(%esp), %eax
	movl	%eax, (%esp)
	call	data_display
	leal	52(%esp), %eax
	movl	%eax, (%esp)
	call	data_cleanup
	movl	$0, %eax
.L3:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
