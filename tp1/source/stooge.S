	.abicalls
	.text
	.align	2
	.globl	length_s
	.ent	length_s
length_s:
	.frame	$fp,24,$31		# vars= 8, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,24
	.cprestore 0
	sw	$fp,20($sp)
	sw	$28,16($sp)
	move	$fp,$sp
	sw	$4,24($fp)
	sw	$0,8($fp)
	lw	$2,24($fp)
	sw	$2,12($fp)
	lw	$2,24($fp)
	sw	$2,12($fp)
$L6:
	lw	$2,12($fp)
	lb	$2,0($2)
	bne	$2,$0,$L9
	b	$L7
$L9:
	lw	$2,8($fp)
	addu	$2,$2,1
	sw	$2,8($fp)
	lw	$2,12($fp)
	addu	$2,$2,1
	sw	$2,12($fp)
	b	$L6
$L7:
	lw	$2,8($fp)
	move	$sp,$fp
	lw	$fp,20($sp)
	addu	$sp,$sp,24
	j	$31
	.end	length_s
	.size	length_s, .-length_s
	.align	2
	.globl	compare_s
	.ent	compare_s
compare_s:
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
	sw	$5,60($fp)
	lw	$4,56($fp)
	la	$25,length_s
	jal	$31,$25
	sw	$2,28($fp)
	lw	$4,60($fp)
	la	$25,length_s
	jal	$31,$25
	sw	$2,32($fp)
	sw	$0,24($fp)
$L11:
	lw	$2,24($fp)
	lw	$3,28($fp)
	sltu	$2,$2,$3
	bne	$2,$0,$L14
	b	$L12
$L14:
	lw	$2,24($fp)
	lw	$3,32($fp)
	sltu	$2,$2,$3
	bne	$2,$0,$L15
	li	$2,1			# 0x1
	sw	$2,36($fp)
	b	$L10
$L15:
	lw	$3,56($fp)
	lw	$2,24($fp)
	addu	$4,$3,$2
	lw	$3,60($fp)
	lw	$2,24($fp)
	addu	$2,$3,$2
	lb	$3,0($4)
	lb	$2,0($2)
	slt	$2,$3,$2
	beq	$2,$0,$L16
	li	$2,-1			# 0xffffffffffffffff
	sw	$2,36($fp)
	b	$L10
$L16:
	lw	$3,56($fp)
	lw	$2,24($fp)
	addu	$4,$3,$2
	lw	$3,60($fp)
	lw	$2,24($fp)
	addu	$2,$3,$2
	lb	$3,0($4)
	lb	$2,0($2)
	slt	$2,$2,$3
	beq	$2,$0,$L13
	li	$2,1			# 0x1
	sw	$2,36($fp)
	b	$L10
$L13:
	lw	$2,24($fp)
	addu	$2,$2,1
	sw	$2,24($fp)
	b	$L11
$L12:
	lw	$2,28($fp)
	lw	$3,32($fp)
	sltu	$2,$2,$3
	beq	$2,$0,$L18
	li	$2,-1			# 0xffffffffffffffff
	sw	$2,36($fp)
	b	$L10
$L18:
	sw	$0,36($fp)
$L10:
	lw	$2,36($fp)
	move	$sp,$fp
	lw	$31,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$31
	.end	compare_s
	.size	compare_s, .-compare_s
	.align	2
	.globl	swap_s
	.ent	swap_s
swap_s:
	.frame	$fp,24,$31		# vars= 8, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,24
	.cprestore 0
	sw	$fp,20($sp)
	sw	$28,16($sp)
	move	$fp,$sp
	sw	$4,24($fp)
	sw	$5,28($fp)
	sw	$6,32($fp)
	lw	$2,28($fp)
	sll	$3,$2,2
	lw	$2,24($fp)
	addu	$2,$3,$2
	lw	$2,0($2)
	sw	$2,8($fp)
	lw	$2,28($fp)
	sll	$3,$2,2
	lw	$2,24($fp)
	addu	$4,$3,$2
	lw	$2,32($fp)
	sll	$3,$2,2
	lw	$2,24($fp)
	addu	$2,$3,$2
	lw	$2,0($2)
	sw	$2,0($4)
	lw	$2,32($fp)
	sll	$3,$2,2
	lw	$2,24($fp)
	addu	$3,$3,$2
	lw	$2,8($fp)
	sw	$2,0($3)
	move	$sp,$fp
	lw	$fp,20($sp)
	addu	$sp,$sp,24
	j	$31
	.end	swap_s
	.size	swap_s, .-swap_s
	.align	2
	.globl	sort_stooge_s
	.ent	sort_stooge_s
sort_stooge_s:
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
	lw	$2,52($fp)
	sll	$3,$2,2
	lw	$2,48($fp)
	addu	$4,$3,$2
	lw	$2,56($fp)
	sll	$3,$2,2
	lw	$2,48($fp)
	addu	$2,$3,$2
	lw	$4,0($4)
	lw	$5,0($2)
	la	$25,compare_s
	jal	$31,$25
	blez	$2,$L22
	lw	$4,48($fp)
	lw	$5,52($fp)
	lw	$6,56($fp)
	la	$25,swap_s
	jal	$31,$25
$L22:
	lw	$3,56($fp)
	lw	$2,52($fp)
	subu	$2,$3,$2
	addu	$2,$2,1
	sltu	$2,$2,3
	bne	$2,$0,$L20
	lw	$3,56($fp)
	lw	$2,52($fp)
	subu	$2,$3,$2
	addu	$3,$2,1
	li	$2,-1431699456			# 0xffffffffaaaa0000
	ori	$2,$2,0xaaab
	multu	$3,$2
	mfhi	$2
	srl	$2,$2,1
	sw	$2,24($fp)
	lw	$3,56($fp)
	lw	$2,24($fp)
	subu	$2,$3,$2
	lw	$4,48($fp)
	lw	$5,52($fp)
	move	$6,$2
	la	$25,sort_stooge_s
	jal	$31,$25
	lw	$3,52($fp)
	lw	$2,24($fp)
	addu	$2,$3,$2
	lw	$4,48($fp)
	move	$5,$2
	lw	$6,56($fp)
	la	$25,sort_stooge_s
	jal	$31,$25
	lw	$3,56($fp)
	lw	$2,24($fp)
	subu	$2,$3,$2
	lw	$4,48($fp)
	lw	$5,52($fp)
	move	$6,$2
	la	$25,sort_stooge_s
	jal	$31,$25
$L20:
	move	$sp,$fp
	lw	$31,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$31
	.end	sort_stooge_s
	.size	sort_stooge_s, .-sort_stooge_s
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
