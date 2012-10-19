	.file	1 "source/stooge.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.text
	.align	2
	.globl	sort_stooge
	.ent	sort_stooge
sort_stooge:
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
	lw	$2,56($fp)
	bgez	$2,$L6
	lw	$2,48($fp)
	lw	$2,4($2)
	addu	$2,$2,-1
	sw	$2,56($fp)
$L6:
	lw	$4,48($fp)
	lw	$2,56($fp)
	sll	$3,$2,2
	lw	$2,0($4)
	addu	$5,$3,$2
	lw	$4,48($fp)
	lw	$2,52($fp)
	sll	$3,$2,2
	lw	$2,0($4)
	addu	$2,$3,$2
	lw	$4,0($5)
	lw	$5,0($2)
	la	$25,strcmp
	jal	$31,$25
	bgez	$2,$L7
	lw	$4,48($fp)
	lw	$2,52($fp)
	sll	$3,$2,2
	lw	$2,0($4)
	addu	$2,$3,$2
	lw	$2,0($2)
	sw	$2,24($fp)
	lw	$4,48($fp)
	lw	$2,52($fp)
	sll	$3,$2,2
	lw	$2,0($4)
	addu	$5,$3,$2
	lw	$4,48($fp)
	lw	$2,56($fp)
	sll	$3,$2,2
	lw	$2,0($4)
	addu	$2,$3,$2
	lw	$2,0($2)
	sw	$2,0($5)
	lw	$4,48($fp)
	lw	$2,56($fp)
	sll	$3,$2,2
	lw	$2,0($4)
	addu	$3,$3,$2
	lw	$2,24($fp)
	sw	$2,0($3)
$L7:
	lw	$3,56($fp)
	lw	$2,52($fp)
	subu	$2,$3,$2
	addu	$2,$2,1
	slt	$2,$2,3
	bne	$2,$0,$L5
	lw	$3,56($fp)
	lw	$2,52($fp)
	subu	$2,$3,$2
	addu	$4,$2,1
	li	$2,1431633920			# 0x55550000
	ori	$2,$2,0x5556
	mult	$4,$2
	mfhi	$3
	sra	$2,$4,31
	subu	$2,$3,$2
	sw	$2,24($fp)
	lw	$3,56($fp)
	lw	$2,24($fp)
	subu	$2,$3,$2
	lw	$4,48($fp)
	lw	$5,52($fp)
	move	$6,$2
	la	$25,sort_stooge
	jal	$31,$25
	lw	$3,52($fp)
	lw	$2,24($fp)
	addu	$2,$3,$2
	lw	$4,48($fp)
	move	$5,$2
	lw	$6,56($fp)
	la	$25,sort_stooge
	jal	$31,$25
	lw	$3,56($fp)
	lw	$2,24($fp)
	subu	$2,$3,$2
	lw	$4,48($fp)
	lw	$5,52($fp)
	move	$6,$2
	la	$25,sort_stooge
	jal	$31,$25
$L5:
	move	$sp,$fp
	lw	$31,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$31
	.end	sort_stooge
	.size	sort_stooge, .-sort_stooge
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
