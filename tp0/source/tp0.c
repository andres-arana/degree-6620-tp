#include <stdio.h>
#include <string.h>
#include "clargs.h"
#include "clargs.h"
#include "cltext.h"
#include "clinput.h"

/**
 * Punto de entrada al programa
 */
int main(int argc, char** argv) {
  /* Instancia que contiene todos los argumentos del programa */
  struct cl_args_t args;
  /* Puntero al archivo de entrada */
  FILE *input;

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

  printf("Files to process: %d\n", args.file_count);
  int i;
  for (i = 0; i < args.file_count; i++) {
    printf("  %s\n", args.files[i]);
  }

  return 0;
}
