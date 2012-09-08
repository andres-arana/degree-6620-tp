#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "data.h"

/*
 * Funcion auxiliar para crear una tabla de n registros
 */
void aux_prepare_table(struct data_t* data, unsigned int n) {
  data->table = malloc(sizeof(char*) * n);
  data->size = n;
}

/*
 * Funcion auxiliar que setea el registro n a un string dado
 */
void aux_set_record(struct data_t* data, unsigned int n, char* record) {
  data->table[n] = malloc(sizeof(char) * strlen(record) + 1);
  strcpy(data->table[n], record);
}

/*
 * Ver documentacion en header
 */
int data_read(struct data_t* data, struct cl_args_t* args) {
  data->table = 0;
  data->size = 0;

  aux_prepare_table(data, 4);
  aux_set_record(data, 0, "hola");
  aux_set_record(data, 1, "como");
  aux_set_record(data, 2, "andas");
  aux_set_record(data, 3, "boludo");
}

/*
 * Ver documentacion en header
 */
void data_display(struct data_t* data) {
  int i;
  for (i = 0; i < data->size; i++) {
    puts(data->table[i]);
  }
}

/*
 * Ver documentacion en header
 */
void data_cleanup(struct data_t* data) {
  int i;
  for (i = 0; i < data->size; i++) {
    free(data->table[i]);
  }
  free(data->table);
}

