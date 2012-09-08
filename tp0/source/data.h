#ifndef __DATA_H_INCLUDED__
#define __DATA_H_INCLUDED__

/**
 * Contiene la estructura de datos que ordenamos
 */
struct data_t {
  /*
   * Los datos que tenemos que ordenar, como un array de strings
   */
  char **data_table;

  /*
   * La cantidad de registros que hay en data_table
   */
  unsigned int size;
};

#endif
