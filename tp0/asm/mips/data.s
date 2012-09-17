	.file	1 "source/data.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.rdata
	.align	2
$LC0:
	.ascii	"ERROR: %s\n\000"
	.align	2
$LC1:
	.ascii	"Not enough memory to initialize data buffer\000"
	.text
	.align	2
	.globl	data_init
	.ent	data_init
data_init:
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
	li	$2,512			# 0x200
	sw	$2,8($3)
	lw	$2,48($fp)
	sw	$0,4($2)
	lw	$16,48($fp)
	lw	$2,48($fp)
	lw	$2,8($2)
	sll	$2,$2,2
	move	$4,$2
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
	.end	data_init
	.size	data_init, .-data_init
	.rdata
	.align	2
$LC2:
	.ascii	"Not enough memory for data buffer overflow\000"
	.text
	.align	2
	.globl	data_pushline
	.ent	data_pushline
data_pushline:
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
	lw	$2,48($fp)
	lw	$3,48($fp)
	lw	$4,4($2)
	lw	$2,8($3)
	sltu	$2,$4,$2
	bne	$2,$0,$L20
	lw	$3,48($fp)
	lw	$2,48($fp)
	lw	$2,8($2)
	addu	$2,$2,512
	sw	$2,8($3)
	lw	$3,48($fp)
	lw	$2,48($fp)
	lw	$2,8($2)
	sll	$2,$2,2
	lw	$4,0($3)
	move	$5,$2
	la	$25,realloc
	jal	$31,$25
	sw	$2,24($fp)
	lw	$2,24($fp)
	bne	$2,$0,$L21
	la	$4,__sF+176
	la	$5,$LC0
	la	$6,$LC2
	la	$25,fprintf
	jal	$31,$25
	sw	$0,28($fp)
	b	$L19
$L21:
	lw	$3,48($fp)
	lw	$2,24($fp)
	sw	$2,0($3)
$L20:
	lw	$4,48($fp)
	lw	$2,48($fp)
	lw	$2,4($2)
	sll	$3,$2,2
	lw	$2,0($4)
	addu	$3,$3,$2
	lw	$2,52($fp)
	sw	$2,0($3)
	lw	$3,48($fp)
	lw	$2,48($fp)
	lw	$2,4($2)
	addu	$2,$2,1
	sw	$2,4($3)
	li	$2,1			# 0x1
	sw	$2,28($fp)
$L19:
	lw	$2,28($fp)
	move	$sp,$fp
	lw	$31,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$31
	.end	data_pushline
	.size	data_pushline, .-data_pushline
	.align	2
	.globl	data_shrink
	.ent	data_shrink
data_shrink:
	.frame	$fp,40,$31		# vars= 0, regs= 4/0, args= 16, extra= 8
	.mask	0xd0010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$31,36($sp)
	sw	$fp,32($sp)
	sw	$28,28($sp)
	sw	$16,24($sp)
	move	$fp,$sp
	sw	$4,40($fp)
	lw	$3,40($fp)
	lw	$2,40($fp)
	lw	$2,4($2)
	sw	$2,8($3)
	lw	$16,40($fp)
	lw	$3,40($fp)
	lw	$2,40($fp)
	lw	$2,8($2)
	sll	$2,$2,2
	lw	$4,0($3)
	move	$5,$2
	la	$25,realloc
	jal	$31,$25
	sw	$2,0($16)
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	lw	$16,24($sp)
	addu	$sp,$sp,40
	j	$31
	.end	data_shrink
	.size	data_shrink, .-data_shrink
	.rdata
	.align	2
$LC3:
	.ascii	"Unable to obtain full line from buffer\000"
	.align	2
$LC4:
	.ascii	"Unable to push new line in data buffer\000"
	.align	2
$LC5:
	.ascii	"Unable to push char into line buffer\000"
	.text
	.align	2
	.globl	accumulate_lines
	.ent	accumulate_lines
accumulate_lines:
	.frame	$fp,64,$31		# vars= 24, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,64
	.cprestore 16
	sw	$31,56($sp)
	sw	$fp,52($sp)
	sw	$28,48($sp)
	move	$fp,$sp
	sw	$4,64($fp)
	sw	$5,68($fp)
	sw	$6,72($fp)
	lw	$4,68($fp)
	la	$25,fgetc
	jal	$31,$25
	sw	$2,24($fp)
$L24:
	lw	$2,68($fp)
	lhu	$2,12($2)
	srl	$2,$2,5
	andi	$2,$2,0x1
	beq	$2,$0,$L27
	lw	$4,72($fp)
	la	$25,buffer_pending
	jal	$31,$25
	bne	$2,$0,$L27
	b	$L25
$L27:
	lbu	$2,24($fp)
	sb	$2,28($fp)
	lw	$2,68($fp)
	lhu	$2,12($2)
	srl	$2,$2,5
	andi	$2,$2,0x1
	bne	$2,$0,$L30
	lb	$3,28($fp)
	li	$2,10			# 0xa
	beq	$3,$2,$L29
$L30:
	lw	$2,68($fp)
	lhu	$2,12($2)
	srl	$2,$2,5
	andi	$2,$2,0x1
	beq	$2,$0,$L28
	lw	$4,72($fp)
	la	$25,buffer_pending
	jal	$31,$25
	bne	$2,$0,$L29
	b	$L28
$L29:
	lw	$4,72($fp)
	la	$25,buffer_reset
	jal	$31,$25
	sw	$2,32($fp)
	lw	$2,32($fp)
	bne	$2,$0,$L31
	la	$4,__sF+176
	la	$5,$LC0
	la	$6,$LC3
	la	$25,fprintf
	jal	$31,$25
	sw	$0,40($fp)
	b	$L23
$L31:
	lw	$4,64($fp)
	lw	$5,32($fp)
	la	$25,data_pushline
	jal	$31,$25
	sw	$2,36($fp)
	lw	$2,36($fp)
	bne	$2,$0,$L26
	la	$4,__sF+176
	la	$5,$LC0
	la	$6,$LC4
	la	$25,fprintf
	jal	$31,$25
	sw	$0,40($fp)
	b	$L23
$L28:
	lb	$2,28($fp)
	lw	$4,72($fp)
	move	$5,$2
	la	$25,buffer_push
	jal	$31,$25
	sw	$2,36($fp)
	lw	$2,36($fp)
	bne	$2,$0,$L26
	la	$4,__sF+176
	la	$5,$LC0
	la	$6,$LC5
	la	$25,fprintf
	jal	$31,$25
	sw	$0,40($fp)
	b	$L23
$L26:
	lw	$4,68($fp)
	la	$25,fgetc
	jal	$31,$25
	sw	$2,24($fp)
	b	$L24
$L25:
	li	$2,1			# 0x1
	sw	$2,40($fp)
$L23:
	lw	$2,40($fp)
	move	$sp,$fp
	lw	$31,56($sp)
	lw	$fp,52($sp)
	addu	$sp,$sp,64
	j	$31
	.end	accumulate_lines
	.size	accumulate_lines, .-accumulate_lines
	.rdata
	.align	2
$LC6:
	.ascii	"Unable to initialize line buffer\000"
	.align	2
$LC7:
	.ascii	"r\000"
	.align	2
$LC8:
	.ascii	"Unable to open file %s\n\000"
	.align	2
$LC9:
	.ascii	"Unable to accumulate lines from multiple files\000"
	.align	2
$LC10:
	.ascii	"Unable to accumulate lines from file\000"
	.text
	.align	2
	.globl	data_read
	.ent	data_read
data_read:
	.frame	$fp,80,$31		# vars= 40, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,80
	.cprestore 16
	sw	$31,72($sp)
	sw	$fp,68($sp)
	sw	$28,64($sp)
	move	$fp,$sp
	sw	$4,80($fp)
	sw	$5,84($fp)
	addu	$2,$fp,32
	move	$4,$2
	la	$25,buffer_init
	jal	$31,$25
	sw	$2,24($fp)
	lw	$2,24($fp)
	bne	$2,$0,$L36
	la	$4,__sF+176
	la	$5,$LC0
	la	$6,$LC6
	la	$25,fprintf
	jal	$31,$25
	sw	$0,56($fp)
	b	$L35
$L36:
	lw	$2,84($fp)
	lw	$2,20($2)
	beq	$2,$0,$L37
	sw	$0,48($fp)
$L38:
	lw	$2,84($fp)
	lw	$3,48($fp)
	lw	$2,20($2)
	slt	$2,$3,$2
	bne	$2,$0,$L41
	b	$L44
$L41:
	lw	$4,84($fp)
	lw	$2,48($fp)
	sll	$3,$2,2
	lw	$2,16($4)
	addu	$2,$3,$2
	lw	$4,0($2)
	la	$5,$LC7
	la	$25,fopen
	jal	$31,$25
	sw	$2,52($fp)
	lw	$2,52($fp)
	bne	$2,$0,$L42
	lw	$4,84($fp)
	lw	$2,48($fp)
	sll	$3,$2,2
	lw	$2,16($4)
	addu	$2,$3,$2
	la	$4,$LC8
	lw	$5,0($2)
	la	$25,printf
	jal	$31,$25
	addu	$2,$fp,32
	move	$4,$2
	la	$25,buffer_cleanup
	jal	$31,$25
	sw	$0,56($fp)
	b	$L35
$L42:
	addu	$2,$fp,32
	lw	$4,80($fp)
	lw	$5,52($fp)
	move	$6,$2
	la	$25,accumulate_lines
	jal	$31,$25
	sw	$2,24($fp)
	lw	$2,24($fp)
	bne	$2,$0,$L43
	la	$4,__sF+176
	la	$5,$LC0
	la	$6,$LC9
	la	$25,fprintf
	jal	$31,$25
	lw	$4,52($fp)
	la	$25,fclose
	jal	$31,$25
	addu	$2,$fp,32
	move	$4,$2
	la	$25,buffer_cleanup
	jal	$31,$25
	sw	$0,56($fp)
	b	$L35
$L43:
	lw	$4,52($fp)
	la	$25,fclose
	jal	$31,$25
	lw	$2,48($fp)
	addu	$2,$2,1
	sw	$2,48($fp)
	b	$L38
$L37:
	addu	$2,$fp,32
	lw	$4,80($fp)
	la	$5,__sF
	move	$6,$2
	la	$25,accumulate_lines
	jal	$31,$25
	sw	$2,24($fp)
	lw	$2,24($fp)
	bne	$2,$0,$L44
	la	$4,__sF+176
	la	$5,$LC0
	la	$6,$LC10
	la	$25,fprintf
	jal	$31,$25
	addu	$2,$fp,32
	move	$4,$2
	la	$25,buffer_cleanup
	jal	$31,$25
	sw	$0,56($fp)
	b	$L35
$L44:
	addu	$2,$fp,32
	move	$4,$2
	la	$25,buffer_cleanup
	jal	$31,$25
	lw	$4,80($fp)
	la	$25,data_shrink
	jal	$31,$25
	li	$2,1			# 0x1
	sw	$2,56($fp)
$L35:
	lw	$2,56($fp)
	move	$sp,$fp
	lw	$31,72($sp)
	lw	$fp,68($sp)
	addu	$sp,$sp,80
	j	$31
	.end	data_read
	.size	data_read, .-data_read
	.align	2
	.globl	data_display
	.ent	data_display
data_display:
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
	sw	$0,24($fp)
$L47:
	lw	$2,48($fp)
	lw	$3,24($fp)
	lw	$2,4($2)
	sltu	$2,$3,$2
	bne	$2,$0,$L50
	b	$L46
$L50:
	lw	$4,48($fp)
	lw	$2,24($fp)
	sll	$3,$2,2
	lw	$2,0($4)
	addu	$2,$3,$2
	lw	$4,0($2)
	la	$25,puts
	jal	$31,$25
	lw	$2,24($fp)
	addu	$2,$2,1
	sw	$2,24($fp)
	b	$L47
$L46:
	move	$sp,$fp
	lw	$31,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$31
	.end	data_display
	.size	data_display, .-data_display
	.align	2
	.globl	data_cleanup
	.ent	data_cleanup
data_cleanup:
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
	sw	$0,24($fp)
$L52:
	lw	$2,48($fp)
	lw	$3,24($fp)
	lw	$2,4($2)
	sltu	$2,$3,$2
	bne	$2,$0,$L55
	b	$L53
$L55:
	lw	$4,48($fp)
	lw	$2,24($fp)
	sll	$3,$2,2
	lw	$2,0($4)
	addu	$2,$3,$2
	lw	$4,0($2)
	la	$25,free
	jal	$31,$25
	lw	$2,24($fp)
	addu	$2,$2,1
	sw	$2,24($fp)
	b	$L52
$L53:
	lw	$2,48($fp)
	lw	$4,0($2)
	la	$25,free
	jal	$31,$25
	move	$sp,$fp
	lw	$31,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$31
	.end	data_cleanup
	.size	data_cleanup, .-data_cleanup
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
