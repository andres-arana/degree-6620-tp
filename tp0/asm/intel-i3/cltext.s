	.file	"cltext.c"
	.section	.rodata
.LC0:
	.string	"tp0 [OPTIONS] [FILE]"
	.align 4
.LC1:
	.string	"-h, --help        display this help and exit"
	.align 4
.LC2:
	.string	"-v, --version     display version information and exit"
	.align 4
.LC3:
	.string	"-q, --quick       use the quicksort algorithm"
	.align 4
.LC4:
	.string	"-s, --stooge      use the stoogesort algorithm"
	.text
	.globl	cl_text_help
	.type	cl_text_help, @function
cl_text_help:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$.LC0, (%esp)
	call	puts
	movl	$.LC1, (%esp)
	call	puts
	movl	$.LC2, (%esp)
	call	puts
	movl	$.LC3, (%esp)
	call	puts
	movl	$.LC4, (%esp)
	call	puts
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	cl_text_help, .-cl_text_help
	.section	.rodata
.LC5:
	.string	"tpo 1.0.0"
	.text
	.globl	cl_text_version
	.type	cl_text_version, @function
cl_text_version:
.LFB1:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$.LC5, (%esp)
	call	puts
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	cl_text_version, .-cl_text_version
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
