/************************************************************************
Nombres de registros entendibles
************************************************************************/
#define zero    $0    /* Contiene el valor cero unicamente */
#define AT      $1    /* Registro temporal de trabajo para el ensamblador */
#define v0      $2    /* Valor de retorno */
#define v1      $3    /* Valor de retorno */
#define a0      $4    /* Argumento */
#define a1      $5    /* Argumento */
#define a2      $6    /* Argumento */
#define a3      $7    /* Argumento */
#define t0      $8    /* Temporal (Caller saved) */
#define t1      $9    /* Temporal (Caller saved) */
#define t2      $10   /* Temporal (Caller saved) */
#define t3      $11   /* Temporal (Caller saved) */
#define t4      $12   /* Temporal (Caller saved) */
#define t5      $13   /* Temporal (Caller saved) */
#define t6      $14   /* Temporal (Caller saved) */
#define t7      $15   /* Temporal (Caller saved) */
#define s0      $16   /* Salvado (Callee preserved) */
#define s1      $17   /* Salvado (Callee preserved) */
#define s2      $18   /* Salvado (Callee preserved) */
#define s3      $19   /* Salvado (Callee preserved) */
#define s4      $20   /* Salvado (Callee preserved) */
#define s5      $21   /* Salvado (Callee preserved) */
#define s6      $22   /* Salvado (Callee preserved) */
#define s7      $23   /* Salvado (Callee preserved) */
#define t8      $24   /* Temporal (Caller saved) */
#define t9      $25   /* Temporal (Caller saved) */
#define jp      $25   /* Registro de jump de PIC, apunta al mismo lugar que t9 */
#define k0      $26   /* Privado del kernel */
#define k1      $27   /* Privado del kernel */
#define gp      $28   /* Global pointer */
#define sp      $29   /* Stack pointer */
#define fp      $30   /* Frame pointer */
#define s8      $30   /* Salvado (Callee preserved), apunta al mismo lugar que fp */
#define ra      $31   /* Direccion de retorno */

/************************************************************************
Definicion de la funcion compare_s. Esta funcion es una implementacion propia
de la funcion de la libreria estandar strcmp, determinando el orden
lexicografico entre dos cadenas. Devuelve -1 si la primer cadena es anterior a
la segunda, 0 si son equivalentes y 1 si la segunda cadena es anterior a la
primera.

El prototipo en C es como sigue:

int compare_s(char* start, char* end);
************************************************************************/
compare_s: .ent compare_s

  # Frame de tamanio 0
  .frame fp,0,ra

COMP_LOOP:
  # Se cargan los bytes apuntados por los argumentos
  lb t0, (a0)
  lb t1, (a1)
  # Si el primer caracter es menor que el segundo, la primer cadena es anterior
  # a la segunda
  slt t2, t0, t1
  bne t2, zero, COMP_RETLT
  # Si ambos son iguales, significa que tienen la misma longitud y ninguno de
  # los caracteres recorridos hasta el momento fueron distintos.
  beq t0, t1, COMP_EQUALS
  # Si el primer caracter es superior al segundo, la primer cadena es posterior
  # a la segunda. Continuamos en la siguiente seccion

COMP_RETGT:
  # Si llegamos aqui es porque la segunda cadena es anterior a la primera
  li v0, 1
  b COMP_RETURN

COMP_RETLT:
  # Si llegamos aqui es porque la primer cadena es anterior a la segunda
  li v0, -1
  b COMP_RETURN

COMP_RETEQ:
  # Si llegamos aqui es porque ambas cadenas son iguales
  move v0, zero
  b COMP_RETURN

COMP_EQUALS:
  # Si llegamos aqui es porque los caracteres son iguales. Si ambos son cero,
  # todos los caracteres procesados fueron iguales y llegamos simultaneamente
  # al final de ambas cadenas, por lo que las cadenas son iguales.
  or t2, t0, t1
  beq t2, zero, COMP_RETEQ
  # Si no son ambos cero pero el primero si es cero, estamos al final de la
  # primer cadena. La primer cadena esta contenida en la segunda, por lo que es
  # menor
  beq t0, zero, COMP_RETLT
  # Si no son ambos cero pero el segundo si es cero, estamos al final de la
  # segunda cadena. La segunda cadena esta contenida en la primera, por lo que
  # es menor
  beq t1, zero, COMP_RETGT
  # Si llegamos aqui es porque todavia hay mas caracteres que comparar, por lo
  # que avanzamos los punteros a los caracteres y continuamos
  addu a0, a0, 1
  addu a1, a1, 1
  b COMP_LOOP

COMP_RETURN:
  jr ra
.end compare_s
.size compare_s, .-compare_s

	.globl	swap_s
	.ent	swap_s
swap_s:
	.frame	fp,24,$31		# vars= 8, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	sp,sp,24
	.cprestore 0
	sw	fp,20(sp)
	sw	$28,16(sp)
	move	fp,sp
	sw	$4,24(fp)
	sw	$5,28(fp)
	sw	$6,32(fp)
	lw	$2,28(fp)
	sll	$3,$2,2
	lw	$2,24(fp)
	addu	$2,$3,$2
	lw	$2,0($2)
	sw	$2,8(fp)
	lw	$2,28(fp)
	sll	$3,$2,2
	lw	$2,24(fp)
	addu	$4,$3,$2
	lw	$2,32(fp)
	sll	$3,$2,2
	lw	$2,24(fp)
	addu	$2,$3,$2
	lw	$2,0($2)
	sw	$2,0($4)
	lw	$2,32(fp)
	sll	$3,$2,2
	lw	$2,24(fp)
	addu	$3,$3,$2
	lw	$2,8(fp)
	sw	$2,0($3)
	move	sp,fp
	lw	fp,20(sp)
	addu	sp,sp,24
	j	$31
	.end	swap_s
	.size	swap_s, .-swap_s
	.align	2
	.globl	sort_stooge_s
	.ent	sort_stooge_s
sort_stooge_s:
	.frame	fp,48,$31		# vars= 8, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	sp,sp,48
	.cprestore 16
	sw	$31,40(sp)
	sw	fp,36(sp)
	sw	$28,32(sp)
	move	fp,sp
	sw	$4,48(fp)
	sw	$5,52(fp)
	sw	$6,56(fp)
	lw	$2,52(fp)
	sll	$3,$2,2
	lw	$2,48(fp)
	addu	$4,$3,$2
	lw	$2,56(fp)
	sll	$3,$2,2
	lw	$2,48(fp)
	addu	$2,$3,$2
	lw	$4,0($4)
	lw	$5,0($2)
	la	$25,compare_s
	jal	$31,$25
	blez	$2,$L22
	lw	$4,48(fp)
	lw	$5,52(fp)
	lw	$6,56(fp)
	la	$25,swap_s
	jal	$31,$25
$L22:
	lw	$3,56(fp)
	lw	$2,52(fp)
	subu	$2,$3,$2
	addu	$2,$2,1
	sltu	$2,$2,3
	bne	$2,$0,$L20
	lw	$3,56(fp)
	lw	$2,52(fp)
	subu	$2,$3,$2
	addu	$3,$2,1
	li	$2,-1431699456			# 0xffffffffaaaa0000
	ori	$2,$2,0xaaab
	multu	$3,$2
	mfhi	$2
	srl	$2,$2,1
	sw	$2,24(fp)
	lw	$3,56(fp)
	lw	$2,24(fp)
	subu	$2,$3,$2
	lw	$4,48(fp)
	lw	$5,52(fp)
	move	$6,$2
	la	$25,sort_stooge_s
	jal	$31,$25
	lw	$3,52(fp)
	lw	$2,24(fp)
	addu	$2,$3,$2
	lw	$4,48(fp)
	move	$5,$2
	lw	$6,56(fp)
	la	$25,sort_stooge_s
	jal	$31,$25
	lw	$3,56(fp)
	lw	$2,24(fp)
	subu	$2,$3,$2
	lw	$4,48(fp)
	lw	$5,52(fp)
	move	$6,$2
	la	$25,sort_stooge_s
	jal	$31,$25
$L20:
	move	sp,fp
	lw	$31,40(sp)
	lw	fp,36(sp)
	addu	sp,sp,48
	j	$31
	.end	sort_stooge_s
	.size	sort_stooge_s, .-sort_stooge_s
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
