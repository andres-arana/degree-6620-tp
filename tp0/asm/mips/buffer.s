	.file	1 "source/buffer.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.rdata
	.align	2
$LC0:
	.ascii	"ERROR: %s\n\000"
	.align	2
$LC1:
	.ascii	"Not enough memory to initialize line buffer\000"
	.text
	.align	2
	.globl	buffer_init
	.ent	buffer_init
buffer_init:
	.frame	$fp,48,$31		# vars= 8, regs= 4/0, args= 16, extra= 8
	.mask	0xd0010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$31,44($sp)
	sw	$fp,40($sp)
	sw	$28,36($sp)
	sw	$16,32($sp)
	move	$fp,$sp
	sw	$4,48($fp)
	lw	$3,48($fp)
	li	$2,32			# 0x20
	sw	$2,4($3)
	lw	$2,48($fp)
	sw	$0,8($2)
	lw	$16,48($fp)
	lw	$2,48($fp)
	lw	$4,4($2)
	la	$25,malloc
	jal	$31,$25
	sw	$2,0($16)
	lw	$2,48($fp)
	lw	$2,0($2)
	bne	$2,$0,$L18
	la	$4,__sF+176
	la	$5,$LC0
	la	$6,$LC1
	la	$25,fprintf
	jal	$31,$25
	sw	$0,24($fp)
	b	$L17
$L18:
	li	$2,1			# 0x1
	sw	$2,24($fp)
$L17:
	lw	$2,24($fp)
	move	$sp,$fp
	lw	$31,44($sp)
	lw	$fp,40($sp)
	lw	$16,32($sp)
	addu	$sp,$sp,48
	j	$31
	.end	buffer_init
	.size	buffer_init, .-buffer_init
	.rdata
	.align	2
$LC2:
	.ascii	"Not enough memory for line buffer overflow\000"
	.text
	.align	2
	.globl	buffer_push
	.ent	buffer_push
buffer_push:
	.frame	$fp,56,$31		# vars= 16, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,56
	.cprestore 16
	sw	$31,48($sp)
	sw	$fp,44($sp)
	sw	$28,40($sp)
	move	$fp,$sp
	sw	$4,56($fp)
	move	$2,$5
	sb	$2,24($fp)
	lw	$2,56($fp)
	lw	$3,56($fp)
	lw	$4,8($2)
	lw	$2,4($3)
	sltu	$2,$4,$2
	bne	$2,$0,$L20
	lw	$3,56($fp)
	lw	$2,56($fp)
	lw	$2,4($2)
	addu	$2,$2,32
	sw	$2,4($3)
	lw	$2,56($fp)
	lw	$3,56($fp)
	lw	$4,0($2)
	lw	$5,4($3)
	la	$25,realloc
	jal	$31,$25
	sw	$2,28($fp)
	lw	$2,28($fp)
	bne	$2,$0,$L21
	la	$4,__sF+176
	la	$5,$LC0
	la	$6,$LC2
	la	$25,fprintf
	jal	$31,$25
	sw	$0,32($fp)
	b	$L19
$L21:
	lw	$3,56($fp)
	lw	$2,28($fp)
	sw	$2,0($3)
$L20:
	lw	$2,56($fp)
	lw	$3,56($fp)
	lw	$4,0($2)
	lw	$2,8($3)
	addu	$3,$4,$2
	lbu	$2,24($fp)
	sb	$2,0($3)
	lw	$3,56($fp)
	lw	$2,56($fp)
	lw	$2,8($2)
	addu	$2,$2,1
	sw	$2,8($3)
	li	$2,1			# 0x1
	sw	$2,32($fp)
$L19:
	lw	$2,32($fp)
	move	$sp,$fp
	lw	$31,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$31
	.end	buffer_push
	.size	buffer_push, .-buffer_push
	.rdata
	.align	2
$LC3:
	.ascii	"Not enough memory for line buffer reset\000"
	.text
	.align	2
	.globl	buffer_reset
	.ent	buffer_reset
buffer_reset:
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
	lw	$2,8($2)
	addu	$2,$2,1
	move	$4,$2
	la	$25,malloc
	jal	$31,$25
	sw	$2,24($fp)
	lw	$2,24($fp)
	bne	$2,$0,$L23
	la	$4,__sF+176
	la	$5,$LC0
	la	$6,$LC3
	la	$25,fprintf
	jal	$31,$25
	sw	$0,28($fp)
	b	$L22
$L23:
	lw	$2,48($fp)
	lw	$3,48($fp)
	lw	$4,24($fp)
	lw	$5,0($2)
	lw	$6,8($3)
	la	$25,memcpy
	jal	$31,$25
	lw	$2,48($fp)
	lw	$3,24($fp)
	lw	$2,8($2)
	addu	$2,$3,$2
	sb	$0,0($2)
	lw	$2,48($fp)
	sw	$0,8($2)
	lw	$2,24($fp)
	sw	$2,28($fp)
$L22:
	lw	$2,28($fp)
	move	$sp,$fp
	lw	$31,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$31
	.end	buffer_reset
	.size	buffer_reset, .-buffer_reset
	.align	2
	.globl	buffer_pending
	.ent	buffer_pending
buffer_pending:
	.frame	$fp,16,$31		# vars= 0, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,16
	.cprestore 0
	sw	$fp,12($sp)
	sw	$28,8($sp)
	move	$fp,$sp
	sw	$4,16($fp)
	lw	$2,16($fp)
	lw	$2,8($2)
	move	$sp,$fp
	lw	$fp,12($sp)
	addu	$sp,$sp,16
	j	$31
	.end	buffer_pending
	.size	buffer_pending, .-buffer_pending
	.align	2
	.globl	buffer_cleanup
	.ent	buffer_cleanup
buffer_cleanup:
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
	lw	$2,40($fp)
	lw	$4,0($2)
	la	$25,free
	jal	$31,$25
	move	$sp,$fp
	lw	$31,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$31
	.end	buffer_cleanup
	.size	buffer_cleanup, .-buffer_cleanup
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
