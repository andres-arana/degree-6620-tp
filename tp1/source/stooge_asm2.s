#include <mips/regdef.h>
	.text
	.align	2                       # alignment module 2
	.globl	sort_stooge             # declared externally and set as global to be accessed
	.ent	sort_stooge             # marks the beginning of the sort_stooge function
sort_stooge:                            # definition of sort_stooge label
	.frame	$fp,48,ra		# vars= 8, regs= 3/0, args= 16, extra= 8
	.set	noreorder
	.cpload	t9
	.set	reorder
	subu	sp,sp,48
	.cprestore 0


#que hacemos aca?????
	la	t9,strcmp
	jal	ra,t9


$L7:
#llamada recursiva a stoogesort
	la	t9,sort_stooge
	jal	ra,t9




$L5:
	j	ra
	.end	sort_stooge
