#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "data.h"

/*
 * Ver documentacion en header
 */
int data_read(struct data_t* data, struct cl_args_t* args) {
  data->table = 0;
  data->size = 0;

  data->table = malloc(sizeof(char *) * 2);
  data->table[0] = malloc(sizeof(char) * 5);
  strcpy(data->table[0], "hola");
  data->table[1] = malloc(sizeof(char) * 5);
  strcpy(data->table[1], "chau");
  data->size = 2;
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

