	.file	1 "source/cltext.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.rdata
	.align	2
$LC0:
	.ascii	"tp0 [OPTIONS] [FILE]\000"
	.align	2
$LC1:
	.ascii	"-h, --help        display this help and exit\000"
	.align	2
$LC2:
	.ascii	"-v, --version     display version information and exit\000"
	.align	2
$LC3:
	.ascii	"-q, --quick       use the quicksort algorithm\000"
	.align	2
$LC4:
	.ascii	"-s, --stooge      use the stoogesort algorithm\000"
	.text
	.align	2
	.globl	cl_text_help
	.ent	cl_text_help
cl_text_help:
	.frame	$fp,40,$31		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$31,32($sp)
	sw	$fp,28($sp)
	sw	$28,24($sp)
	move	$fp,$sp
	la	$4,$LC0
	la	$25,puts
	jal	$31,$25
	la	$4,$LC1
	la	$25,puts
	jal	$31,$25
	la	$4,$LC2
	la	$25,puts
	jal	$31,$25
	la	$4,$LC3
	la	$25,puts
	jal	$31,$25
	la	$4,$LC4
	la	$25,puts
	jal	$31,$25
	move	$sp,$fp
	lw	$31,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$31
	.end	cl_text_help
	.size	cl_text_help, .-cl_text_help
	.rdata
	.align	2
$LC5:
	.ascii	"tpo 1.0.0\000"
	.text
	.align	2
	.globl	cl_text_version
	.ent	cl_text_version
cl_text_version:
	.frame	$fp,40,$31		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$31,32($sp)
	sw	$fp,28($sp)
	sw	$28,24($sp)
	move	$fp,$sp
	la	$4,$LC5
	la	$25,puts
	jal	$31,$25
	move	$sp,$fp
	lw	$31,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$31
	.end	cl_text_version
	.size	cl_text_version, .-cl_text_version
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
