#include <stdio.h>
#include <string.h>
#include "clargs.h"

/*
 * Imprime un mensaje de error por una opcion invalida.
 */
void show_invalid_option(char* offending_option) {
  printf("Invalid option: %s\n\n", offending_option);
}

/*
 * Imprime un mensaje de error por ingresar un flag despues de los archivos
 */
void show_arg_after_file(char* offending_option) {
  printf("Option found after input file: %s\n\n", offending_option);
}

/*
 * Ver documentacion en el header
 */
int cl_args_parse(struct cl_args_t* args, int argc, char** argv) {
  int i;

  /* Establece los valores por default de la estructura. */
  args->help = 0;
  args->version = 0;
  args->quicksort = 0;
  args->stoogesort = 0;
  args->files = 0;
  args->file_count = 0;

  /* Lee cada uno de los argumentos. */
  for (i = 1; i < argc; i++) {
    if (args->file_count && argv[i][0] == '-') {
      /* Si ya estamos procesando los archivos y pasan un flag es invalido */
      show_arg_after_file(argv[i]);
      return 0;
    } else if (!strcmp(argv[i], "-h") || !strcmp(argv[i], "--help")) {
      args->help = 1;
    } else if (!strcmp(argv[i], "-v") || !strcmp(argv[i], "--version")) {
      args->version = 1;
    } else if (!strcmp(argv[i], "-q") || !strcmp(argv[i], "--quick")) {
      args->quicksort = 1;
    } else if (!strcmp(argv[i], "-s") || !strcmp(argv[i], "--stooge")) {
      args->stoogesort = 1;
    } else if (argv[i][0] != '-') {
      if (!args->file_count) {
        args->files = &argv[i];
      }
      args->file_count++;

    } else {
      show_invalid_option(argv[i]);
      return 0;
    }
  }

  return 1;
}

/*
 * Ver documentacion en el header
 */
int cl_args_validate(struct cl_args_t* args) {
  if (args-> help) {
    if (args->version || args->quicksort || args->stoogesort || args->files) {
      fputs("No other option can be used when the -h or the --help options are used.", stderr);
      return 0;
    }
  }

  if (args->version) {
    if (args->help || args->quicksort || args->stoogesort || args->files) {
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
