	.file	"clargs.c"
	.section	.rodata
.LC0:
	.string	"Invalid option: %s\n\n"
	.text
	.globl	show_invalid_option
	.type	show_invalid_option, @function
show_invalid_option:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$.LC0, %eax
	movl	8(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	printf
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	show_invalid_option, .-show_invalid_option
	.section	.rodata
	.align 4
.LC1:
	.string	"Option found after input file: %s\n\n"
	.text
	.globl	show_arg_after_file
	.type	show_arg_after_file, @function
show_arg_after_file:
.LFB1:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$.LC1, %eax
	movl	8(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	printf
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	show_arg_after_file, .-show_arg_after_file
	.section	.rodata
.LC2:
	.string	"-h"
.LC3:
	.string	"--help"
.LC4:
	.string	"-v"
.LC5:
	.string	"--version"
.LC6:
	.string	"-q"
.LC7:
	.string	"--quick"
.LC8:
	.string	"-s"
.LC9:
	.string	"--stooge"
	.text
	.globl	cl_args_parse
	.type	cl_args_parse, @function
cl_args_parse:
.LFB2:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	subl	$32, %esp
	movl	8(%ebp), %eax
	movl	$0, (%eax)
	movl	8(%ebp), %eax
	movl	$0, 4(%eax)
	movl	8(%ebp), %eax
	movl	$0, 8(%eax)
	movl	8(%ebp), %eax
	movl	$0, 12(%eax)
	movl	8(%ebp), %eax
	movl	$0, 16(%eax)
	movl	8(%ebp), %eax
	movl	$0, 20(%eax)
	movl	$1, -12(%ebp)
	jmp	.L4
	.cfi_offset 6, -16
	.cfi_offset 7, -12
.L18:
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	testl	%eax, %eax
	je	.L5
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	16(%ebp), %eax
	movl	(%eax), %eax
	movzbl	(%eax), %eax
	cmpb	$45, %al
	jne	.L5
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	show_arg_after_file
	movl	$0, %eax
	jmp	.L6
.L5:
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, %edx
	movl	$.LC2, %eax
	movl	$3, %ecx
	movl	%edx, %esi
	movl	%eax, %edi
	repz cmpsb
	seta	%dl
	setb	%al
	movl	%edx, %ecx
	subb	%al, %cl
	movl	%ecx, %eax
	movsbl	%al, %eax
	testl	%eax, %eax
	je	.L7
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, %edx
	movl	$.LC3, %eax
	movl	$7, %ecx
	movl	%edx, %esi
	movl	%eax, %edi
	repz cmpsb
	seta	%dl
	setb	%al
	movl	%edx, %ecx
	subb	%al, %cl
	movl	%ecx, %eax
	movsbl	%al, %eax
	testl	%eax, %eax
	jne	.L8
.L7:
	movl	8(%ebp), %eax
	movl	$1, (%eax)
	jmp	.L9
.L8:
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, %edx
	movl	$.LC4, %eax
	movl	$3, %ecx
	movl	%edx, %esi
	movl	%eax, %edi
	repz cmpsb
	seta	%dl
	setb	%al
	movl	%edx, %ecx
	subb	%al, %cl
	movl	%ecx, %eax
	movsbl	%al, %eax
	testl	%eax, %eax
	je	.L10
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, %edx
	movl	$.LC5, %eax
	movl	$10, %ecx
	movl	%edx, %esi
	movl	%eax, %edi
	repz cmpsb
	seta	%dl
	setb	%al
	movl	%edx, %ecx
	subb	%al, %cl
	movl	%ecx, %eax
	movsbl	%al, %eax
	testl	%eax, %eax
	jne	.L11
.L10:
	movl	8(%ebp), %eax
	movl	$1, 4(%eax)
	jmp	.L9
.L11:
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, %edx
	movl	$.LC6, %eax
	movl	$3, %ecx
	movl	%edx, %esi
	movl	%eax, %edi
	repz cmpsb
	seta	%dl
	setb	%al
	movl	%edx, %ecx
	subb	%al, %cl
	movl	%ecx, %eax
	movsbl	%al, %eax
	testl	%eax, %eax
	je	.L12
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, %edx
	movl	$.LC7, %eax
	movl	$8, %ecx
	movl	%edx, %esi
	movl	%eax, %edi
	repz cmpsb
	seta	%dl
	setb	%al
	movl	%edx, %ecx
	subb	%al, %cl
	movl	%ecx, %eax
	movsbl	%al, %eax
	testl	%eax, %eax
	jne	.L13
.L12:
	movl	8(%ebp), %eax
	movl	$1, 8(%eax)
	jmp	.L9
.L13:
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, %edx
	movl	$.LC8, %eax
	movl	$3, %ecx
	movl	%edx, %esi
	movl	%eax, %edi
	repz cmpsb
	seta	%dl
	setb	%al
	movl	%edx, %ecx
	subb	%al, %cl
	movl	%ecx, %eax
	movsbl	%al, %eax
	testl	%eax, %eax
	je	.L14
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, %edx
	movl	$.LC9, %eax
	movl	$9, %ecx
	movl	%edx, %esi
	movl	%eax, %edi
	repz cmpsb
	seta	%dl
	setb	%al
	movl	%edx, %ecx
	subb	%al, %cl
	movl	%ecx, %eax
	movsbl	%al, %eax
	testl	%eax, %eax
	jne	.L15
.L14:
	movl	8(%ebp), %eax
	movl	$1, 12(%eax)
	jmp	.L9
.L15:
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	16(%ebp), %eax
	movl	(%eax), %eax
	movzbl	(%eax), %eax
	cmpb	$45, %al
	je	.L16
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	testl	%eax, %eax
	jne	.L17
	movl	-12(%ebp), %eax
	sall	$2, %eax
	movl	%eax, %edx
	addl	16(%ebp), %edx
	movl	8(%ebp), %eax
	movl	%edx, 16(%eax)
.L17:
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	leal	1(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 20(%eax)
	jmp	.L9
.L16:
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	show_invalid_option
	movl	$0, %eax
	jmp	.L6
.L9:
	addl	$1, -12(%ebp)
.L4:
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	.L18
	movl	$1, %eax
.L6:
	addl	$32, %esp
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_def_cfa 4, 4
	.cfi_restore 5
	ret
	.cfi_endproc
.LFE2:
	.size	cl_args_parse, .-cl_args_parse
	.section	.rodata
	.align 4
.LC10:
	.string	"No other option can be used when the -h or the --help options are used."
	.align 4
.LC11:
	.string	"No other option can be used when the -v or the --version options are used."
	.align 4
.LC12:
	.string	"Only one sort algorithm may be specified"
	.align 4
.LC13:
	.string	"One sorting algorithm must be specified"
	.text
	.globl	cl_args_validate
	.type	cl_args_validate, @function
cl_args_validate:
.LFB3:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	.L20
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	.L21
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	jne	.L21
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	testl	%eax, %eax
	jne	.L21
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	testl	%eax, %eax
	je	.L20
.L21:
	movl	stderr, %eax
	movl	%eax, %edx
	movl	$.LC10, %eax
	movl	%edx, 12(%esp)
	movl	$71, 8(%esp)
	movl	$1, 4(%esp)
	movl	%eax, (%esp)
	call	fwrite
	movl	$0, %eax
	jmp	.L22
.L20:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	je	.L23
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	.L24
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	jne	.L24
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	testl	%eax, %eax
	jne	.L24
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	testl	%eax, %eax
	je	.L23
.L24:
	movl	stderr, %eax
	movl	%eax, %edx
	movl	$.LC11, %eax
	movl	%edx, 12(%esp)
	movl	$74, 8(%esp)
	movl	$1, 4(%esp)
	movl	%eax, (%esp)
	call	fwrite
	movl	$0, %eax
	jmp	.L22
.L23:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	.L25
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	.L25
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	je	.L26
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	testl	%eax, %eax
	je	.L26
	movl	stderr, %eax
	movl	%eax, %edx
	movl	$.LC12, %eax
	movl	%edx, 12(%esp)
	movl	$40, 8(%esp)
	movl	$1, 4(%esp)
	movl	%eax, (%esp)
	call	fwrite
	movl	$0, %eax
	jmp	.L22
.L26:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	jne	.L25
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	testl	%eax, %eax
	jne	.L25
	movl	stderr, %eax
	movl	%eax, %edx
	movl	$.LC13, %eax
	movl	%edx, 12(%esp)
	movl	$39, 8(%esp)
	movl	$1, 4(%esp)
	movl	%eax, (%esp)
	call	fwrite
	movl	$0, %eax
	jmp	.L22
.L25:
	movl	$1, %eax
.L22:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	cl_args_validate, .-cl_args_validate
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
