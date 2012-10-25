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
	subu	sp,sp,32
	.cprestore 24
        sw ra, 28(sp)     # guardo el ra
        sw a2, 40(sp)     # guardo j en el aba del stack de la funcion que me llamo
        sw a1, 36(sp)     # guardo i en el aba del stack de la funcion que me llamo
        sw a0, 32(sp)     # guardo array en el aba del stack de la funcion que me llamo
        sw s0, 20(sp)     # guardo el s0

        addu t0, a0, a1   # guardo en t0 el resultado de array[i]
        addu t1, a0, a2   # guardo en t1 el resultado de array[j]

        move a0, t0       # guardo el contenido de t0 (array[i]) en a0
        move a1, t1       # guardo el contenido de t0 (array[j]) en a0

        la t9, compare_s  # almaceno el contenido de el label a t9
        jal ra, t9        # llamo a la funcion

        bgtz v0, swap_s   # en caso que sea mayor a 0 hago el swap

        sw t0, 40(sp)     # guardo el valor del j en el t0
        sw t0, 36(sp)     # guardo el valor del i en el t1
        subu t2, t0, t1   # resto los contenidos de t0 y t1
        subu t2, t2, -2   # sumo 1 inmediato y resto 3
        bltz t2, salgo    # entra en el if  en donde llama recursivamente a los stoogesort

        addu t2, t2, 3    # lo dejo con j - i + 1 (next_end)
        divu t2, 3        # divido inmediatamente por 3
        mflo t0           # cargo el resultado en t0

        move s0, t0       # paso el contenido de next_end a s0
        subu t1, t1, t0   # resto el end con el next_end
        move a2, t1       # guardo en a2 el end - next_end
        lw a1, 36(sp)     # guardo i en el aba del stack de la funcion que voy a llamar
        lw a0, 32(sp)     # guardo array en el aba del stack de la funcion que voy a llamar
        la t9, sort_stooge
        jal ra, t9        # llamo a la funcion stooge_sort
        

        lw t1, 36(sp)     # guardo el contenido de i en el t1
        move t0, s0       # paso el contenido de next_end a s0
        addu t1, t1, t0   # sumo start con el next_end
        lw a2, 36(sp)     # guardo j en el aba del stack de la funcion que voy a llamar
        move a1, t1       # guardo en a1 el start - next_end
        lw a0, 32(sp)     # guardo array en el aba del stack de la funcion que voy a llamar
        la t9, sort_stooge
        jal ra, t9        # llamo a la funcion stooge_sort

        lw t1, 40(sp)     # guardo el contenido de i en el t1
        move s0, t0       # paso el contenido de next_end a s0
        subu t1, t1, t0   # resto el end con el next_end
        move a2, t1       # guardo en a2 el end - next_end
        lw a1, 36(sp)     # guardo i en el aba del stack de la funcion que voy a llamar
        lw a0, 32(sp)     # guardo array en el aba del stack de la funcion que voy a llamar
        la t9, sort_stooge
        jal ra, t9        # llamo a la funcion stooge_sort

	j	ra
	.end	sort_stooge
