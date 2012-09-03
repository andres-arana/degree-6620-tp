#include <stdio.h>
#include <string.h>

/*
 * Estructura que contiene todos los flags de la linea de comandos.
 */
struct cli_args_t {
  /*
   * 1 si se requiere help, 0 en caso contrario.
   */
  int help;

  /*
   * 1 si se requiere informacion de version, 0 en caso contrario.
   */
  int version;

  /*
   * 1 si se requiere utilizar quicksort, 0 en caso contrario.
   */
  int quicksort;

  /*
   * 1 si se requiere stooge sort, 0 en caso contrario.
   */
  int stoogesort;

  /*
   * Nombre del archivo a ordenar, si se ingreso alguno. 0 en caso contrario.
   */
  char* file;
};

/*
 * Imprime informacion de ayuda en stdout.
 */
void show_help() {
  puts("tp0 [OPTIONS] [FILE]");
  puts("-h, --help        display this help and exit");
  puts("-v, --version     display version information and exit");
  puts("-q, --quick       use the quicksort algorithm");
  puts("-s, --stooge      use the stoogesort algorithm");
}

/*
 * Imprime informacion de version en stdout.
 */
void show_version() {
  puts("tpo 1.0.0");
}

/*
 * Imprime un mensaje de error por una opción inválida.
 */
void show_invalid_option(char* offending_option) {
  printf("Invalid option: %s\n\n", offending_option);
  show_help();
}

/*
 * Funcion que extrae los parametros de la linea de comandos dada por los
 * argumentos argc y argv de una funcion main, cargando los resultados en la
 * estructura de argumentos args.
 */
int parse_args(struct cli_args_t* args, int argc, char** argv) {
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
 * Funcion que valida la interaccion entre los argumentos de la linea de
 * comandos, imprimiendo un mensaje de error segun corresponda.
 */
int validate_args(struct cli_args_t* args) {
  /* Si se incluye la opcion de ayuda, no puede incluirse ninguna otra */
  if (args-> help) {
    if (args->version || args->quicksort || args->stoogesort || args->file) {
      puts("No other option can be used when the -h or the --help options are used.");
      return 0;
    }
  }

  /* Si se incluye la opcion de version, no puede incluirse ninguna otra */
  if (args->version) {
    if (args->help || args->quicksort || args->stoogesort || args-> file) {
      puts("No other option can be used when the -v or the --version options are used.");
      return 0;
    }
  }

  /* Si se incluye la opcion de quicksort no puede usarse stoogesort y
   * viceversa */
  if (!args->help && !args->version) {
    if (args->quicksort && args->stoogesort) {
      puts("Only one sort algorithm may be specified");
      return 0;
    }

    /* Se debe incluir alguna de las opciones de algoritmos */
    if (!args->quicksort && !args->stoogesort) {
      puts("One sorting algorithm must be specified");
      return 0;
    }
  }

  return 1;
}

/**
 * Punto de entrada al programa
 */
int main(int argc, char** argv) {
  /* Instancia que contiene todos los argumentos del programa */
  struct cli_args_t args;

  /* Carga en args los argumentos de la linea de comandos */
  if (!parse_args(&args, argc, argv)) {
    return 1;
  }

  /* Valida los argumentos */
  if (!validate_args(&args)) {
    show_help();
    return 1;
  }

  if (args.help) {
    show_help();
    return 0;
  }

  if (args.version) {
    show_version();
    return 0;
  }

  return 0;
}
