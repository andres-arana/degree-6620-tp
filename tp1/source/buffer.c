#include <string.h>
#include <stdlib.h>
#include "buffer.h"
#include "config.h"

/*
 * Ver documentacion en el header
 */
int buffer_init(struct buffer_t* buffer) {
  buffer->size = 32;
  buffer->current = 0;
  buffer->buffer = malloc(sizeof(char) * buffer->size);
  if (!buffer->buffer) {
    LOG_DATA_DEBUG("Malloc on buffer_init returned zero");
    LOG_ERROR("Not enough memory to initialize line buffer");
    return 0;
  }
  return 1;
}

/*
 * Ver documentacion en el header
 */
int buffer_push(struct buffer_t* buffer, char c) {
  /* Si hay overflow, se suman otros 32 bytes al tamanio del buffer */
  if (buffer->current >= buffer->size) {
    char* new_buffer;

    LOG_DATA_DEBUG("Overflow while pushing char to buffer. Increase buffer size");
    buffer->size += 32;
    LOG_DATA_DEBUG_IVAR(buffer->size);

    new_buffer = realloc(buffer->buffer, sizeof(char) * buffer->size);
    if (!new_buffer) {
      LOG_DATA_DEBUG("Realloc on buffer_push returned zero");
      LOG_ERROR("Not enough memory for line buffer overflow");
      return 0;
    }

    buffer->buffer = new_buffer;
  }

  buffer->buffer[buffer->current] = c;
  buffer->current++;
  return 1;
}

/*
 * Ver documentacion en el header
 */
struct line_t* buffer_reset(struct buffer_t* buffer) {
  char* data;
  struct line_t* line;

  data = malloc(sizeof(char) * buffer->current);
  if (!data) {
    LOG_DATA_DEBUG("Malloc on buffer_reset returned zero");
    LOG_ERROR("Not enough memory for line buffer reset");
    return 0;
  }

  line = malloc(sizeof(struct line_t));
  if (!line) {
    free(data);
    LOG_DATA_DEBUG("Malloc on buffer_reset returned zero");
    LOG_ERROR("Not enough memory for line buffer reset");
    return 0;
  }

  memcpy(data, buffer->buffer, sizeof(char) * buffer->current);
  line->data = data;
  line->size = buffer->current;

  /* Se resetea el buffer para seguir acumulando chars */
  buffer->current = 0;

  return line;
}

/*
 * Ver documentacion en el header
 */
int buffer_pending(struct buffer_t* buffer) {
  return buffer->current;
}

/*
 * Ver documentacion en el header
 */
void buffer_cleanup(struct buffer_t* buffer) {
  free(buffer->buffer);
}

/*
 * Ver documentacion en header
 */
int line_compare(struct line_t* a, struct line_t* b) {
  int i;
  for (i = 0; i < a->size; i++) {
    if (i >= b->size) {
      return 1;
    }

    if (a->data[i] < b->data[i]) {
      return -1;
    }

    if (a->data[i] > b->data[i]) {
      return 1;
    }
  }

  if (a->size < b->size) {
    return -1;
  }

  return 0;
}
