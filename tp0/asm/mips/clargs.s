	.file	1 "source/clargs.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.rdata
	.align	2
$LC0:
	.ascii	"Invalid option: %s\n\n\000"
	.text
	.align	2
	.globl	show_invalid_option
	.ent	show_invalid_option
show_invalid_option:
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
	sw	$4,40($fp)
	la	$4,$LC0
	lw	$5,40($fp)
	la	$25,printf
	jal	$31,$25
	move	$sp,$fp
	lw	$31,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$31
	.end	show_invalid_option
	.size	show_invalid_option, .-show_invalid_option
	.rdata
	.align	2
$LC1:
	.ascii	"Option found after input file: %s\n\n\000"
	.text
	.align	2
	.globl	show_arg_after_file
	.ent	show_arg_after_file
show_arg_after_file:
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
	sw	$4,40($fp)
	la	$4,$LC1
	lw	$5,40($fp)
	la	$25,printf
	jal	$31,$25
	move	$sp,$fp
	lw	$31,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$31
	.end	show_arg_after_file
	.size	show_arg_after_file, .-show_arg_after_file
	.rdata
	.align	2
$LC2:
	.ascii	"-h\000"
	.align	2
$LC3:
	.ascii	"--help\000"
	.align	2
$LC4:
	.ascii	"-v\000"
	.align	2
$LC5:
	.ascii	"--version\000"
	.align	2
$LC6:
	.ascii	"-q\000"
	.align	2
$LC7:
	.ascii	"--quick\000"
	.align	2
$LC8:
	.ascii	"-s\000"
	.align	2
$LC9:
	.ascii	"--stooge\000"
	.text
	.align	2
	.globl	cl_args_parse
	.ent	cl_args_parse
cl_args_parse:
	.frame	$fp,48,$31		# vars= 8, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$31,40($sp)
	sw	$fp,36($sp)
	sw	$28,32($sp)
	move	$fp,$sp
	sw	$4,48($fp)
	sw	$5,52($fp)
	sw	$6,56($fp)
	lw	$2,48($fp)
	sw	$0,0($2)
	lw	$2,48($fp)
	sw	$0,4($2)
	lw	$2,48($fp)
	sw	$0,8($2)
	lw	$2,48($fp)
	sw	$0,12($2)
	lw	$2,48($fp)
	sw	$0,16($2)
	lw	$2,48($fp)
	sw	$0,20($2)
	li	$2,1			# 0x1
	sw	$2,24($fp)
$L8:
	lw	$2,24($fp)
	lw	$3,52($fp)
	slt	$2,$2,$3
	bne	$2,$0,$L11
	b	$L9
$L11:
	lw	$2,48($fp)
	lw	$2,20($2)
	beq	$2,$0,$L12
	lw	$2,24($fp)
	sll	$3,$2,2
	lw	$2,56($fp)
	addu	$2,$3,$2
	lw	$2,0($2)
	lb	$3,0($2)
	li	$2,45			# 0x2d
	bne	$3,$2,$L12
	lw	$2,24($fp)
	sll	$3,$2,2
	lw	$2,56($fp)
	addu	$2,$3,$2
	lw	$4,0($2)
	la	$25,show_arg_after_file
	jal	$31,$25
	sw	$0,28($fp)
	b	$L7
$L12:
	lw	$2,24($fp)
	sll	$3,$2,2
	lw	$2,56($fp)
	addu	$2,$3,$2
	lw	$4,0($2)
	la	$5,$LC2
	la	$25,strcmp
	jal	$31,$25
	beq	$2,$0,$L15
	lw	$2,24($fp)
	sll	$3,$2,2
	lw	$2,56($fp)
	addu	$2,$3,$2
	lw	$4,0($2)
	la	$5,$LC3
	la	$25,strcmp
	jal	$31,$25
	bne	$2,$0,$L14
$L15:
	lw	$3,48($fp)
	li	$2,1			# 0x1
	sw	$2,0($3)
	b	$L10
$L14:
	lw	$2,24($fp)
	sll	$3,$2,2
	lw	$2,56($fp)
	addu	$2,$3,$2
	lw	$4,0($2)
	la	$5,$LC4
	la	$25,strcmp
	jal	$31,$25
	beq	$2,$0,$L18
	lw	$2,24($fp)
	sll	$3,$2,2
	lw	$2,56($fp)
	addu	$2,$3,$2
	lw	$4,0($2)
	la	$5,$LC5
	la	$25,strcmp
	jal	$31,$25
	bne	$2,$0,$L17
$L18:
	lw	$3,48($fp)
	li	$2,1			# 0x1
	sw	$2,4($3)
	b	$L10
$L17:
	lw	$2,24($fp)
	sll	$3,$2,2
	lw	$2,56($fp)
	addu	$2,$3,$2
	lw	$4,0($2)
	la	$5,$LC6
	la	$25,strcmp
	jal	$31,$25
	beq	$2,$0,$L21
	lw	$2,24($fp)
	sll	$3,$2,2
	lw	$2,56($fp)
	addu	$2,$3,$2
	lw	$4,0($2)
	la	$5,$LC7
	la	$25,strcmp
	jal	$31,$25
	bne	$2,$0,$L20
$L21:
	lw	$3,48($fp)
	li	$2,1			# 0x1
	sw	$2,8($3)
	b	$L10
$L20:
	lw	$2,24($fp)
	sll	$3,$2,2
	lw	$2,56($fp)
	addu	$2,$3,$2
	lw	$4,0($2)
	la	$5,$LC8
	la	$25,strcmp
	jal	$31,$25
	beq	$2,$0,$L24
	lw	$2,24($fp)
	sll	$3,$2,2
	lw	$2,56($fp)
	addu	$2,$3,$2
	lw	$4,0($2)
	la	$5,$LC9
	la	$25,strcmp
	jal	$31,$25
	bne	$2,$0,$L23
$L24:
	lw	$3,48($fp)
	li	$2,1			# 0x1
	sw	$2,12($3)
	b	$L10
$L23:
	lw	$2,24($fp)
	sll	$3,$2,2
	lw	$2,56($fp)
	addu	$2,$3,$2
	lw	$2,0($2)
	lb	$3,0($2)
	li	$2,45			# 0x2d
	beq	$3,$2,$L26
	lw	$2,48($fp)
	lw	$2,20($2)
	bne	$2,$0,$L27
	lw	$4,48($fp)
	lw	$2,24($fp)
	sll	$3,$2,2
	lw	$2,56($fp)
	addu	$2,$2,$3
	sw	$2,16($4)
$L27:
	lw	$3,48($fp)
	lw	$2,48($fp)
	lw	$2,20($2)
	addu	$2,$2,1
	sw	$2,20($3)
	b	$L10
$L26:
	lw	$2,24($fp)
	sll	$3,$2,2
	lw	$2,56($fp)
	addu	$2,$3,$2
	lw	$4,0($2)
	la	$25,show_invalid_option
	jal	$31,$25
	sw	$0,28($fp)
	b	$L7
$L10:
	lw	$2,24($fp)
	addu	$2,$2,1
	sw	$2,24($fp)
	b	$L8
$L9:
	li	$2,1			# 0x1
	sw	$2,28($fp)
$L7:
	lw	$2,28($fp)
	move	$sp,$fp
	lw	$31,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$31
	.end	cl_args_parse
	.size	cl_args_parse, .-cl_args_parse
	.rdata
	.align	2
$LC10:
	.ascii	"No other option can be used when the -h or the --help op"
	.ascii	"tions are used.\000"
	.align	2
$LC11:
	.ascii	"No other option can be used when the -v or the --version"
	.ascii	" options are used.\000"
	.align	2
$LC12:
	.ascii	"Only one sort algorithm may be specified\000"
	.align	2
$LC13:
	.ascii	"One sorting algorithm must be specified\000"
	.text
	.align	2
	.globl	cl_args_validate
	.ent	cl_args_validate
cl_args_validate:
	.frame	$fp,48,$31		# vars= 8, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$31,40($sp)
	sw	$fp,36($sp)
	sw	$28,32($sp)
	move	$fp,$sp
	sw	$4,48($fp)
	lw	$2,48($fp)
	lw	$2,0($2)
	beq	$2,$0,$L30
	lw	$2,48($fp)
	lw	$2,4($2)
	bne	$2,$0,$L32
	lw	$2,48($fp)
	lw	$2,8($2)
	bne	$2,$0,$L32
	lw	$2,48($fp)
	lw	$2,12($2)
	bne	$2,$0,$L32
	lw	$2,48($fp)
	lw	$2,16($2)
	bne	$2,$0,$L32
	b	$L30
$L32:
	la	$4,$LC10
	la	$5,__sF+176
	la	$25,fputs
	jal	$31,$25
	sw	$0,24($fp)
	b	$L29
$L30:
	lw	$2,48($fp)
	lw	$2,4($2)
	beq	$2,$0,$L33
	lw	$2,48($fp)
	lw	$2,0($2)
	bne	$2,$0,$L35
	lw	$2,48($fp)
	lw	$2,8($2)
	bne	$2,$0,$L35
	lw	$2,48($fp)
	lw	$2,12($2)
	bne	$2,$0,$L35
	lw	$2,48($fp)
	lw	$2,16($2)
	bne	$2,$0,$L35
	b	$L33
$L35:
	la	$4,$LC11
	la	$5,__sF+176
	la	$25,fputs
	jal	$31,$25
	sw	$0,24($fp)
	b	$L29
$L33:
	lw	$2,48($fp)
	lw	$2,0($2)
	bne	$2,$0,$L36
	lw	$2,48($fp)
	lw	$2,4($2)
	bne	$2,$0,$L36
	lw	$2,48($fp)
	lw	$2,8($2)
	beq	$2,$0,$L37
	lw	$2,48($fp)
	lw	$2,12($2)
	beq	$2,$0,$L37
	la	$4,$LC12
	la	$5,__sF+176
	la	$25,fputs
	jal	$31,$25
	sw	$0,24($fp)
	b	$L29
$L37:
	lw	$2,48($fp)
	lw	$2,8($2)
	bne	$2,$0,$L36
	lw	$2,48($fp)
	lw	$2,12($2)
	bne	$2,$0,$L36
	la	$4,$LC13
	la	$5,__sF+176
	la	$25,fputs
	jal	$31,$25
	sw	$0,24($fp)
	b	$L29
$L36:
	li	$2,1			# 0x1
	sw	$2,24($fp)
$L29:
	lw	$2,24($fp)
	move	$sp,$fp
	lw	$31,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$31
	.end	cl_args_validate
	.size	cl_args_validate, .-cl_args_validate
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
