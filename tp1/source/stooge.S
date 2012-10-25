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

  # Frame size
  .frame sp,0,ra

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

/************************************************************************
Definicion de la funcion swap_s. Esta funcion intercambia dos punteros ubicados
en dos indices dados de un array de strings determinado.

El prototipo en C es como sigue:

void swap_c(char **data, unsigned int a, unsigned int b);
************************************************************************/
swap_s: .ent swap_s

  # Frame size
  .frame sp,0,ra

  # Se computa la direccion en memoria donde se encuentra el primer elemento a
  # intercambiar: a1 = a0 + (a1 * 4)
  sll t0, a1, 2
  addu a1, a0, t0

  # Se computa la direccion en memoria donde se encuentra el segundo elemento a
  # intercambiar: a2 = a0 + (a2 * 4)
  sll t0, a2, 2
  addu a2, a0, t0

  # Se cargan en memoria los valores a intercambiar
  lw t0, (a1)
  lw t1, (a2)

  # Se guardan nuevamente en orden inverso
  sw t0, (a2)
  sw t1, (a1)

  jr ra
.end swap_s
.size swap_s, .-swap_s

.globl sort_stooge_s
sort_stooge_s: .ent sort_stooge_s

  # Frame size
  #   + 16 bytes RTA: ra, gp, s0, padding
  #   + 16 bytes ABA: a3, a2, a1, a0
  .frame sp,32,ra

  # Set up del global pointer
  .set noreorder
  .cpload t9
  .set reorder

  # Expandimos el stack
  subu sp, sp, 32

  # Grabamos los registros a preservar
  sw ra, 28(sp)
  .cprestore 24
  sw s0, 20(sp)

  # Grabamos los argumentos para preservarlos
  sw a0, 32(sp)
  sw a1, 36(sp)
  sw a2, 40(sp)

  # Calculamos la ubicacion en memoria de los strings a comparar. Dejamos los
  # valores resultantes en a1 y a2
  sll t0, a1, 2
  addu t0, a0, t0
  lw a1, (t0)
  sll t0, a2, 2
  addu t0, a0, t0
  lw a2, (t0)

  # Invocamos a la funcion compare_s
  move a0, a1
  move a1, a2
  la jp, compare_s
  jal ra, jp

  # Restauramos los registros de argumentos
  lw a0, 32(sp)
  lw a1, 36(sp)
  lw a2, 40(sp)

  # Si el resultado es mayor o igual a cero hay que realizar un swap
  blez v0, SORT_NOSWAP
  la jp, swap_s
  jal ra, jp

  # Restauramos los registros de argumentos
  lw a0, 32(sp)
  lw a1, 36(sp)
  lw a2, 40(sp)

SORT_NOSWAP:
  # Calculamos end - start + 1 - 3 en t0
  subu t0, a2, a1
  subu t0, t0, 2

  # Si el resultado es < 0, no es necesario realizar invocaciones recursivas
  bltz t0, SORT_NOREC

  # Calculamos next_end como (end - start + 1) / 3 y lo dejamos en s0
  subu t0, a2, a1
  addu t0, t0, 1
  li t1, 3
  divu t0, t1
  nop # Necesario para asegurar consistencia de LO
  mflo s0

  # Invocacion recursiva en la primera parte del array
  subu a2, a2, s0
  la jp, sort_stooge_s
  jal ra, jp

  # Restauramos los registros de argumentos
  lw a0, 32(sp)
  lw a1, 36(sp)
  lw a2, 40(sp)

  # Invocacion recursiva en la segunda parte del array
  addu a1, a1, s0
  la jp, sort_stooge_s
  jal ra, jp

  # Restauramos los registros de argumentos
  lw a0, 32(sp)
  lw a1, 36(sp)
  lw a2, 40(sp)

  # Invocacion recursiva en la primera parte del array nuevamente
  subu a2, a2, s0
  la jp, sort_stooge_s
  jal ra, jp

SORT_NOREC:
  # Teardown del stack
  lw ra, 28(sp)
  lw s0, 20(sp)

  addu sp, sp, 32

  jr ra
.end sort_stooge_s
.size sort_stooge_s, .-sort_stooge_s

