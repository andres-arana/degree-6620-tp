#include <string.h>
#include "stooge.h"
#include "config.h"
#include "buffer.h"

/*
 * Ver documentacion en el header
 */
void sort_stooge(struct data_t* data, int start, int end) {
  LOG_SORT_DEBUG("Executing stooge sort");
  LOG_SORT_DEBUG_IVAR(start);
  LOG_SORT_DEBUG_IVAR(end);

  if (end < 0) {
    end = data->size - 1;
    LOG_SORT_DEBUG("end is less than zero, adjusting");
    LOG_SORT_DEBUG_IVAR(end);
  }

  if (line_compare(data->table[end], data->table[start]) < 0) {
    data_swap(data, start, end);
  }

  if (end - start + 1 >= 3) {
    int next_end = (end - start + 1) / 3;
    LOG_SORT_DEBUG_IVAR(next_end);

    LOG_SORT_DEBUG("Recursive stoogesort on first 2/3rds");
    sort_stooge(data, start, end - next_end);

    LOG_SORT_DEBUG("Recursive stoogesort on final 2/3rds");
    sort_stooge(data, start + next_end, end);

    LOG_SORT_DEBUG("Recursive stoogesort on first 2/3rds again");
    sort_stooge(data, start, end - next_end);
  }
}

