#ifndef __DATA_H_INCLUDED__
#define __DATA_H_INCLUDED__

#include "clargs.h"

/**
 * Contiene la estructura de datos que ordenamos
 */
struct data_t {
  /*
   * Los datos que tenemos que ordenar, como un array de strings
   */
  char **table;

  /*
   * La cantidad de registros que hay en data_table
   */
  unsigned int size;
};

/*
 * Lee los datos desde los flujos de datos correspondientes a lo especificado
 * en los argumentos
 */
int data_read(struct data_t* data, struct cl_args_t* args);

/*
 * Muestra en pantalla los contenidos de la estructura de datos
 */
void data_display(struct data_t* data);

/**
 * Libera la memoria asociada a los datos leidos en una llamada a data_read
 */
void data_cleanup(struct data_t* data);

#endif
