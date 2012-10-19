#ifndef __DATA_H_INCLUDED__
#define __DATA_H_INCLUDED__

#include "clargs.h"
#include "buffer.h"

/**
 * Contiene la estructura de datos que ordenamos
 */
struct data_t {
  /*
   * Los datos que tenemos que ordenar
   */
  struct line_t** table;

  /*
   * La cantidad de registros que hay en la tabla
   */
  unsigned int size;

  /*
   * La cantidad de registros alocados para la tabla
   */
  unsigned int capacity;
};

/*
 * Funcion que inicializa los datos de una tabla de lineas para empezar a
 * acumular lineas.
 */
int data_init(struct data_t* data);

/*
 * Lee los datos desde los flujos de datos correspondientes a lo especificado
 * en los argumentos
 */
int data_read(struct data_t* data, struct cl_args_t* args);

/**
 * Intercambia las lineas de las posiciones a y b
 */
void data_swap(struct data_t* data, unsigned int a, unsigned int b);

/*
 * Muestra en pantalla los contenidos de la estructura de datos
 */
void data_display(struct data_t* data);

/**
 * Libera la memoria asociada a los datos leidos en una llamada a data_read
 */
void data_cleanup(struct data_t* data);

#endif
