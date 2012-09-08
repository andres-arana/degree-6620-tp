#include <stdio.h>
#include <string.h>
#include "clargs.h"
#include "clargs.h"
#include "cltext.h"
#include "data.h"

/**
 * Punto de entrada al programa
 */
int main(int argc, char** argv) {
  /* Instancia que contiene todos los argumentos del programa */
  struct cl_args_t args;
  /* Instancia que contiene todos los datos a ordenar */
  struct data_t data;

  /* Carga en args los argumentos de la linea de comandos */
  if (!cl_args_parse(&args, argc, argv)) {
    return 1;
  }

  /* Valida los argumentos */
  if (!cl_args_validate(&args)) {
    cl_text_help();
    return 1;
  }

  /* Procesa la ayuda */
  if (args.help) {
    cl_text_help();
    return 0;
  }

  /* Procesa la información de versión */
  if (args.version) {
    cl_text_version();
    return 0;
  }

  /* Obtiene los datos a ordenar desde la entrada correspondiente */
  if (!data_read(&data, &args)) {
    return 1;
  }

  /* Muestra los datos por pantalla */
  data_display(&data);

  /* Cleanup */
  data_cleanup(&data);

  return 0;
}
