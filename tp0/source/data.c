#include <stdlib.h>
#include <string.h>
#include "data.h"
#include "buffer.h"
#include "config.h"

/*
 * Ver documentacion en header
 */
int data_init(struct data_t* data) {
  data->capacity = 1;
  data->size = 0;
  data->table = malloc(sizeof(char *) * data->capacity);
  if (!data->table) {
    LOG_DATA_DEBUG("Malloc on data_init returned zero");
    LOG_ERROR("Not enough memory to initialize data buffer");
    return 0;
  }
  return 1;
}

int data_pushline(struct data_t* data, char* line) {
  /* Si hay overflow, se suman otras 512 lineas al tamaño de la tabla */
  if (data->size >= data->capacity) {
    char **new_table;

    LOG_DATA_DEBUG("Overflow while pushing line to data buffer. Increase buffer size");
    data->capacity += 512;
    LOG_DATA_DEBUG_IVAR(data->capacity);

    new_table = realloc(data->table, sizeof(char*) * data->capacity);
    if (!new_table) {
      LOG_DATA_DEBUG("Realloc on data_pushline returned zero");
      LOG_ERROR("Not enough memory for data buffer overflow");
      return 0;
    }

    data->table = new_table;
  }

  data->table[data->size] = line;
  data->size++;
  return 1;

}

/*
 * Elimina la capacidad excedente para evitar ocupar memoria de mas 
 */
void data_shrink(struct data_t* data) {
  data->capacity = data->size;
  data->table = realloc(data->table, sizeof(char*) * data->capacity);
}

/*
 * Funcion que acumula en data los contenidos de todas las lineas del stream de
 * entrada usando el buffer de acumulacion dado.
 */
int accumulate_lines(struct data_t* data, FILE* stream, struct buffer_t* buffer) {
  int raw_char;
  char actual_char;
  char* new_line;
  int result;

  LOG_DATA_DEBUG("Accumulating lines");
  for (raw_char = fgetc(stream); !feof(stream) || buffer_pending(buffer); raw_char = fgetc(stream)) {
    actual_char = (char) raw_char;
    if ((!feof(stream) && actual_char == '\n') || (feof(stream) && buffer_pending(buffer))) {
      new_line = buffer_reset(buffer);
      if (!new_line) {
        LOG_DATA_DEBUG("Unable to reset buffer in accumulate_lines");
        LOG_ERROR("Unable to obtain full line from buffer");
        return 0;
      }

      result = data_pushline(data, new_line);
      if (!result) {
        LOG_DATA_DEBUG("Unable to push new line in accumulate_lines");
        LOG_ERROR("Unable to push new line in data buffer");
        return 0;
      }
      LOG_DATA_DEBUG("Pushed line to data buffer");
      LOG_DATA_DEBUG_SVAR(new_line);
    } else {
      result = buffer_push(buffer, actual_char);
      if (!result) {
        LOG_DATA_DEBUG("Unable to push char into buffer in accumulate_lines");
        LOG_ERROR("Unable to push char into line buffer");
        return 0;
      }
    }
  }

  return 1;
}

/*
 * Ver documentacion en header
 */
int data_read(struct data_t* data, struct cl_args_t* args) {
  int result;
  struct buffer_t buffer;
  LOG_DATA_DEBUG("Reading data from input");

  /* Se inicializa el buffer de acumulacion de linea */
  result = buffer_init(&buffer);
  if (!result) {
    LOG_DATA_DEBUG("Unable to initialize buffer on data_read");
    LOG_ERROR("Unable to initialize line buffer");
    return 0;
  }

  /* Se acumulan las lineas de todos los archivos */
  if (args->file_count) {
    int i;
    FILE *input;
    for (i = 0; i < args->file_count; i++) {
      LOG_DATA_DEBUG("Processing new file from command line args");
      LOG_DATA_DEBUG_SVAR(args->files[i]);

      input = fopen(args->files[i], "r");
      if (!input) {
        printf("Unable to open file %s\n", args->files[i]);
        buffer_cleanup(&buffer);
        return 0;
      }

      result = accumulate_lines(data, input, &buffer);
      if(!result) {
        LOG_DATA_DEBUG("Unable to accumulate lines from multiple files on data_read");
        LOG_ERROR("Unable to accumulate lines from multiple files");
        fclose(input);
        buffer_cleanup(&buffer);
        return 0;
      }

      fclose(input);
    }
  } else {
    LOG_DATA_DEBUG("Processing input from standard input");
    result = accumulate_lines(data, stdin, &buffer);
    if (!result) {
      LOG_DATA_DEBUG("Unable to accumulate lines from file on data_read");
      LOG_ERROR("Unable to accumulate lines from file");
      buffer_cleanup(&buffer);
      return 0;
    }
  }

  /* Se limpian los recursos que no son mas necesarios */
  buffer_cleanup(&buffer);
  data_shrink(data);
  return 1;
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

