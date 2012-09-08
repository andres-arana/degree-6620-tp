#include <stdio.h>
#include <string.h>
#include "clargs.h"

/*
 * Imprime un mensaje de error por una opción inválida.
 */
void show_invalid_option(char* offending_option) {
  fprintf(stderr, "Invalid option: %s\n\n", offending_option);
}

/*
 * Ver documentacion en cl_args.h
 */
int cl_args_parse(struct cl_args_t* args, int argc, char** argv) {
  int i;

  /* Establece los valores por default de la estructura. */
  args->help = 0;
  args->version = 0;
  args->quicksort = 0;
  args->stoogesort = 0;
  args->file = 0;

  /* Lee cada uno de los argumentos. */
  for (i = 1; i < argc; i++) {
    /* Mapea los argumentos a la estructura args. */
    if (!strcmp(argv[i], "-h") || !strcmp(argv[i], "--help")) {
      args->help = 1;
    } else if (!strcmp(argv[i], "-v") || !strcmp(argv[i], "--version")) {
      args->version = 1;
    } else if (!strcmp(argv[i], "-q") || !strcmp(argv[i], "--quick")) {
      args->quicksort = 1;
    } else if (!strcmp(argv[i], "-s") || !strcmp(argv[i], "--stooge")) {
      args->stoogesort = 1;
    } else if (argv[i][0] != '-' && !(args->file)) {
      args->file = argv[i];
    } else {
      show_invalid_option(argv[i]);
      return 0;
    }
  }

  return 1;
}

/*
 * Ver documentacion en cl_args.h
 */
int cl_args_validate(struct cl_args_t* args) {
  if (args-> help) {
    if (args->version || args->quicksort || args->stoogesort || args->file) {
      fputs("No other option can be used when the -h or the --help options are used.", stderr);
      return 0;
    }
  }

  if (args->version) {
    if (args->help || args->quicksort || args->stoogesort || args-> file) {
      fputs("No other option can be used when the -v or the --version options are used.", stderr);
      return 0;
    }
  }

  if (!args->help && !args->version) {
    if (args->quicksort && args->stoogesort) {
      fputs("Only one sort algorithm may be specified", stderr);
      return 0;
    }

    if (!args->quicksort && !args->stoogesort) {
      fputs("One sorting algorithm must be specified", stderr);
      return 0;
    }
  }

  return 1;
}
