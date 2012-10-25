#include "stooge.h"
#include "config.h"

/*
 * Obtiene la longitud de un string
 */
unsigned int length_c(char* data) {
  unsigned int result = 0;
  char* index = data;
  for (index = data; *index != '\0'; index++) {
    result++;
  }
  return result;
}

/*
 * Compara dos strings
 */
int compare_c(char* start, char* end) {
  unsigned int i;
  unsigned int start_size = length_c(start);
  unsigned int end_size = length_c(end);

  LOG_SORT_DEBUG("Comparing values");
  LOG_SORT_DEBUG_SVAR(start);
  LOG_SORT_DEBUG_SVAR(end);

  for (i = 0; i < start_size; i++) {
    if (i >= end_size) {
      LOG_SORT_DEBUG("End is before start as it is shorter");
      return 1;
    }

    if (start[i] < end[i]) {
      LOG_SORT_DEBUG("Start is before end");
      return -1;
    }

    if (start[i] > end[i]) {
      LOG_SORT_DEBUG("End is before start");
      return 1;
    }
  }

  if (start_size < end_size) {
    LOG_SORT_DEBUG("Start is before end as it is shorter");
    return -1;
  }

  LOG_SORT_DEBUG("Start and end are equal");
  return 0;
}

/*
 * Intercambia los strings en un array de string en dos indices dados
 */
void swap_c(char **data, unsigned int a, unsigned int b) {
  char* tmp = data[a];
  LOG_SORT_DEBUG("Swapping pointers at indices");
  LOG_SORT_DEBUG_IVAR(a);
  LOG_SORT_DEBUG_IVAR(b);
  data[a] = data[b];
  data[b] = tmp;
}

/*
 * Ver documentacion en el header
 */
void sort_stooge_c(char** data, unsigned int start, unsigned int end) {
  LOG_SORT_DEBUG("Executing stooge sort");
  LOG_SORT_DEBUG_IVAR(start);
  LOG_SORT_DEBUG_IVAR(end);

  if (compare_c(data[start], data[end]) > 0) {
    swap_c(data, start, end);
  }

  if (end - start + 1 >= 3) {
    unsigned int next_end = (end - start + 1) / 3;
    LOG_SORT_DEBUG_IVAR(next_end);

    LOG_SORT_DEBUG("Recursive stoogesort on first 2/3rds");
    sort_stooge_c(data, start, end - next_end);

    LOG_SORT_DEBUG("Recursive stoogesort on final 2/3rds");
    sort_stooge_c(data, start + next_end, end);

    LOG_SORT_DEBUG("Recursive stoogesort on first 2/3rds again");
    sort_stooge_c(data, start, end - next_end);
  }
}

