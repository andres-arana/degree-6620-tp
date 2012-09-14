#include <string.h>
#include "stooge.h"
#include "config.h"

/*
 * Ver documentacion en el header
 */
void sort_stooge(struct data_t* data, int start, int end) {
  LOG_DEBUG_STRING("Executing stooge sort");
  LOG_DEBUG_IVAR(start);
  LOG_DEBUG_IVAR(end);

  if (end < 0) {
    end = data->size - 1;
    LOG_DEBUG_STRING("end is less than zero, adjusting");
    LOG_DEBUG_IVAR(end);
  }

  char* line1 = (data->table)[start];
  LOG_DEBUG_SVAR(line1);
  char* line2 = (data->table)[end];
  LOG_DEBUG_SVAR(line2);

  if (strcmp((data->table)[end], (data->table)[start]) < 0) {
    LOG_DEBUG_STRING("line2 should be before line1");
    (data->table)[start] = (data->table)[end];
    (data->table)[end] = line1;
  }

  if (end - start + 1 >= 3) {
    int next_end = (end - start + 1) / 3;
    LOG_DEBUG_IVAR(next_end);

    LOG_DEBUG_STRING("Recursive stoogesort on first 2/3rds");
    sort_stooge(data, start, end - next_end);

    LOG_DEBUG_STRING("Recursive stoogesort on final 2/3rds");
    sort_stooge(data, start + next_end, end);

    LOG_DEBUG_STRING("Recursive stoogesort on first 2/3rds again");
    sort_stooge(data, start, end - next_end);
  }
}

