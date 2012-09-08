/*
 * Obtiene una referencia al FILE* de entrada a utilizar. Puede ser el archivo
 * especificado por linea de comandos, o stdin si no se especificó ninguno.
 * Devuelve 0 si no se puede crear un stream para el archivo especificado en
 * args.
 */
FILE* open_input_stream(struct cli_args_t* args) {
  if (args->file) {
    return fopen(args->file, "r");
  } else {
    return stdin;
  }
}

/*
 * Cierra la referencia al stream de entrada, si es un archivo especificado por
 * la linea de comandos.
 */
void close_input_stream(FILE* stream, struct cli_args_t* args) {
  if (args->file) {
    fclose(stream);
  }
}

