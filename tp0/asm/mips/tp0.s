	.file	1 "source/tp0.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.text
	.align	2
	.globl	main
	.ent	main
main:
	.frame	$fp,88,$31		# vars= 48, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,88
	.cprestore 16
	sw	$31,80($sp)
	sw	$fp,76($sp)
	sw	$28,72($sp)
	move	$fp,$sp
	sw	$4,88($fp)
	sw	$5,92($fp)
	addu	$4,$fp,24
	lw	$5,88($fp)
	lw	$6,92($fp)
	la	$25,cl_args_parse
	jal	$31,$25
	bne	$2,$0,$L6
	li	$2,1			# 0x1
	sw	$2,64($fp)
	b	$L5
$L6:
	addu	$4,$fp,24
	la	$25,cl_args_validate
	jal	$31,$25
	bne	$2,$0,$L7
	la	$25,cl_text_help
	jal	$31,$25
	li	$2,1			# 0x1
	sw	$2,64($fp)
	b	$L5
$L7:
	lw	$2,24($fp)
	beq	$2,$0,$L8
	la	$25,cl_text_help
	jal	$31,$25
	sw	$0,64($fp)
	b	$L5
$L8:
	lw	$2,28($fp)
	beq	$2,$0,$L9
	la	$25,cl_text_version
	jal	$31,$25
	sw	$0,64($fp)
	b	$L5
$L9:
	addu	$2,$fp,48
	move	$4,$2
	la	$25,data_init
	jal	$31,$25
	bne	$2,$0,$L10
	li	$2,1			# 0x1
	sw	$2,64($fp)
	b	$L5
$L10:
	addu	$2,$fp,48
	move	$4,$2
	addu	$5,$fp,24
	la	$25,data_read
	jal	$31,$25
	bne	$2,$0,$L11
	addu	$2,$fp,48
	move	$4,$2
	la	$25,data_cleanup
	jal	$31,$25
	li	$2,1			# 0x1
	sw	$2,64($fp)
	b	$L5
$L11:
	lw	$2,36($fp)
	beq	$2,$0,$L12
	addu	$2,$fp,48
	lw	$3,52($fp)
	addu	$3,$3,-1
	move	$4,$2
	move	$5,$0
	move	$6,$3
	la	$25,sort_stooge
	jal	$31,$25
	b	$L13
$L12:
	addu	$2,$fp,48
	lw	$3,52($fp)
	addu	$3,$3,-1
	move	$4,$2
	move	$5,$0
	move	$6,$3
	la	$25,sort_quicksort
	jal	$31,$25
$L13:
	addu	$2,$fp,48
	move	$4,$2
	la	$25,data_display
	jal	$31,$25
	addu	$2,$fp,48
	move	$4,$2
	la	$25,data_cleanup
	jal	$31,$25
	sw	$0,64($fp)
$L5:
	lw	$2,64($fp)
	move	$sp,$fp
	lw	$31,80($sp)
	lw	$fp,76($sp)
	addu	$sp,$sp,88
	j	$31
	.end	main
	.size	main, .-main
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
