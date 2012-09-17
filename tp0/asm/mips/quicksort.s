	.file	1 "source/quicksort.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.text
	.align	2
	.globl	select_pivot
	.ent	select_pivot
select_pivot:
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
	sw	$5,20($fp)
	lw	$3,20($fp)
	lw	$2,16($fp)
	subu	$3,$3,$2
	sra	$2,$3,31
	srl	$2,$2,31
	addu	$2,$3,$2
	sra	$3,$2,1
	lw	$2,16($fp)
	addu	$2,$3,$2
	move	$sp,$fp
	lw	$fp,12($sp)
	addu	$sp,$sp,16
	j	$31
	.end	select_pivot
	.size	select_pivot, .-select_pivot
	.align	2
	.globl	print_data
	.ent	print_data
print_data:
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
$L7:
	lw	$2,24($fp)
	lw	$3,8($fp)
	lw	$2,4($2)
	sltu	$2,$3,$2
	bne	$2,$0,$L9
	b	$L6
$L9:
	lw	$2,8($fp)
	addu	$2,$2,1
	sw	$2,8($fp)
	b	$L7
$L6:
	move	$sp,$fp
	lw	$fp,20($sp)
	addu	$sp,$sp,24
	j	$31
	.end	print_data
	.size	print_data, .-print_data
	.align	2
	.globl	swap_lines
	.ent	swap_lines
swap_lines:
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
	lw	$4,24($fp)
	lw	$2,28($fp)
	sll	$3,$2,2
	lw	$2,0($4)
	addu	$2,$3,$2
	lw	$2,0($2)
	sw	$2,8($fp)
	lw	$4,24($fp)
	lw	$2,28($fp)
	sll	$3,$2,2
	lw	$2,0($4)
	addu	$5,$3,$2
	lw	$4,24($fp)
	lw	$2,32($fp)
	sll	$3,$2,2
	lw	$2,0($4)
	addu	$2,$3,$2
	lw	$2,0($2)
	sw	$2,0($5)
	lw	$4,24($fp)
	lw	$2,32($fp)
	sll	$3,$2,2
	lw	$2,0($4)
	addu	$3,$3,$2
	lw	$2,8($fp)
	sw	$2,0($3)
	move	$sp,$fp
	lw	$fp,20($sp)
	addu	$sp,$sp,24
	j	$31
	.end	swap_lines
	.size	swap_lines, .-swap_lines
	.align	2
	.globl	sort_quicksort
	.ent	sort_quicksort
sort_quicksort:
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
	sw	$6,64($fp)
	sw	$0,28($fp)
	sw	$0,32($fp)
	sw	$0,36($fp)
	lw	$2,60($fp)
	lw	$3,64($fp)
	slt	$2,$2,$3
	beq	$2,$0,$L12
	lw	$4,60($fp)
	lw	$5,64($fp)
	la	$25,select_pivot
	jal	$31,$25
	sw	$2,36($fp)
	lw	$4,56($fp)
	lw	$5,60($fp)
	lw	$6,36($fp)
	la	$25,swap_lines
	jal	$31,$25
	lw	$4,56($fp)
	lw	$2,60($fp)
	sll	$3,$2,2
	lw	$2,0($4)
	addu	$2,$3,$2
	lw	$2,0($2)
	sw	$2,24($fp)
	lw	$2,60($fp)
	addu	$2,$2,1
	sw	$2,28($fp)
	lw	$2,64($fp)
	sw	$2,32($fp)
$L14:
	lw	$2,28($fp)
	lw	$3,32($fp)
	slt	$2,$3,$2
	beq	$2,$0,$L17
	b	$L15
$L17:
	lw	$2,28($fp)
	lw	$3,64($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L18
	lw	$4,56($fp)
	lw	$2,28($fp)
	sll	$3,$2,2
	lw	$2,0($4)
	addu	$2,$3,$2
	lw	$4,0($2)
	lw	$5,24($fp)
	la	$25,strcmp
	jal	$31,$25
	blez	$2,$L19
	b	$L18
$L19:
	lw	$2,28($fp)
	addu	$2,$2,1
	sw	$2,28($fp)
	b	$L17
$L18:
	.set	noreorder
	nop
	.set	reorder
$L21:
	lw	$2,32($fp)
	lw	$3,60($fp)
	slt	$2,$2,$3
	bne	$2,$0,$L22
	lw	$4,56($fp)
	lw	$2,32($fp)
	sll	$3,$2,2
	lw	$2,0($4)
	addu	$2,$3,$2
	lw	$4,0($2)
	lw	$5,24($fp)
	la	$25,strcmp
	jal	$31,$25
	bgtz	$2,$L23
	b	$L22
$L23:
	lw	$2,32($fp)
	addu	$2,$2,-1
	sw	$2,32($fp)
	b	$L21
$L22:
	lw	$2,28($fp)
	lw	$3,32($fp)
	slt	$2,$2,$3
	beq	$2,$0,$L14
	lw	$4,56($fp)
	lw	$5,28($fp)
	lw	$6,32($fp)
	la	$25,swap_lines
	jal	$31,$25
	b	$L14
$L15:
	lw	$4,56($fp)
	lw	$5,60($fp)
	lw	$6,32($fp)
	la	$25,swap_lines
	jal	$31,$25
	lw	$2,32($fp)
	addu	$2,$2,-1
	lw	$4,56($fp)
	lw	$5,60($fp)
	move	$6,$2
	la	$25,sort_quicksort
	jal	$31,$25
	lw	$2,32($fp)
	addu	$2,$2,1
	lw	$4,56($fp)
	move	$5,$2
	lw	$6,64($fp)
	la	$25,sort_quicksort
	jal	$31,$25
$L12:
	move	$sp,$fp
	lw	$31,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$31
	.end	sort_quicksort
	.size	sort_quicksort, .-sort_quicksort
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
