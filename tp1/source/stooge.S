/* Nomenclatura de registros */
#include <mips/regdef.h>

/* Nomenclatura de registros adicionales no incluidos en regdef */
#define fp  $30
#define jp  $25

/************************************************************************
Definicion de la funcion compare_s. Esta funcion es una implementacion propia
de la funcion de la libreria estandar strcmp, determinando el orden
lexicografico entre dos cadenas. Devuelve un numero negativo si la primer
cadena es anterior a la segunda, 0 si son equivalentes y un numero positivo si
la segunda cadena es anterior a la primera.

El prototipo en C es como sigue:

int compare_s(char* start, char* end);
************************************************************************/
compare_s: .ent compare_s

  # Frame size
  #   + 8 bytes SRA: gp, fp
  .frame sp,8,ra

  # Set up del global pointer
  .set noreorder
  .cpload jp
  .set reorder

  # Expandimos el stack
  subu sp, sp, 8

  # Grabamos los registros a preservar
  .cprestore 4
  sw fp, 0(sp)

COMP_LOOP:
  # Se cargan los bytes apuntados por los argumentos
  lb t0, (a0)
  lb t1, (a1)
  # Si el primer caracter es menor que el segundo, la primer cadena es anterior
  # a la segunda
  subu v0, t0, t1
  bltz v0, COMP_RETURN
  # Si ambos son iguales, significa que tienen la misma longitud y ninguno de
  # los caracteres recorridos hasta el momento fueron distintos.
  beqz v0, COMP_EQUALS
  # Si llegamos aqui es porque el primer caracter es superior al segundo y la
  # primer cadena es posterior a la segunda. Continuamos en la siguiente
  # seccion
  b COMP_RETURN

COMP_EQUALS:
  # Si llegamos aqui es porque los caracteres son iguales. Si ambos son cero,
  # todos los caracteres procesados fueron iguales y llegamos simultaneamente
  # al final de ambas cadenas, por lo que las cadenas son iguales.
  beq t0, zero, COMP_RETURN
  # Si llegamos aqui es porque todavia hay mas caracteres que comparar, por lo
  # que avanzamos los punteros a los caracteres subsiguientes y continuamos
  addu a0, a0, 1
  addu a1, a1, 1
  b COMP_LOOP

COMP_RETURN:
  # Teardown del stack
  lw fp, 0(sp)

  addu sp, sp, 8

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
  #   + 8 bytes SRA: gp, fp
  .frame sp,8,ra

  # Set up del global pointer
  .set noreorder
  .cpload jp
  .set reorder

  # Expandimos el stack
  subu sp, sp, 8

  # Grabamos los registros a preservar
  .cprestore 4
  sw fp, 0(sp)

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

  # Teardown del stack
  lw fp, 0(sp)

  addu sp, sp, 8

  jr ra
.end swap_s
.size swap_s, .-swap_s

/************************************************************************
Definicion de la funcion sort_stooge_s. Esta funcion ordena una tabla de datos
a traves del algoritmo stoogesort.

El prototipo en C es como sigue:

void sort_stooge_s(char **data, unsigned int start, unsigned int end);
************************************************************************/
.globl sort_stooge_s
sort_stooge_s: .ent sort_stooge_s

  # Frame size
  #   + 16 bytes SRA: ra, gp, s0, fp
  #   + 16 bytes ABA: a3, a2, a1, a0
  .frame sp,32,ra

  # Set up del global pointer
  .set noreorder
  .cpload jp
  .set reorder

  # Expandimos el stack
  subu sp, sp, 32

  # Grabamos los registros a preservar
  sw ra, 28(sp)
  .cprestore 24
  sw s0, 20(sp)
  sw fp, 16(sp)

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
  lw fp, 16(sp)

  addu sp, sp, 32

  jr ra
.end sort_stooge_s
.size sort_stooge_s, .-sort_stooge_s

