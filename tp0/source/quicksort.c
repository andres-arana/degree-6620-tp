#include <stdio.h>
#include <string.h>
#include "quicksort.h"
#include "config.h"
#include "buffer.h"

int select_pivot(int start, int end) {
  return (start + ((end - start) / 2));
}

void sort_quicksort(struct data_t* data, int start, int end) {
  LOG_SORT_DEBUG("Executing quicksort sort");
  LOG_SORT_DEBUG_IVAR(start);
  LOG_SORT_DEBUG_IVAR(end);
  struct line_t* key;
  int left = 0;
  int right = 0;
  int pivot_position = 0;

  if (start < end) {
    LOG_SORT_DEBUG("start is less than end");
    pivot_position = select_pivot(start, end);
    LOG_SORT_DEBUG_IVAR(pivot_position);

    LOG_SORT_DEBUG("swapping lines between start and pivot_position");
    data_swap(data, start, pivot_position);

    key = data->table[start];

    left = start + 1;
    LOG_SORT_DEBUG_IVAR(left);

    right = end;
    LOG_SORT_DEBUG_IVAR(right);

    while (left <= right) {
      LOG_SORT_DEBUG("left is less or equals than right");

      while ((left <= end) && (line_compare(data->table[left], key) <= 0)) {
        LOG_SORT_DEBUG("left is less or equals than end and compare_key is less or equals than key");
        left++;
        LOG_SORT_DEBUG_IVAR(left);
      }

      while ((right >= start) && (line_compare(data->table[right], key) > 0)) {
        LOG_SORT_DEBUG("right is greater or equals than start and compare_key is greater than key");
        right--;
        LOG_SORT_DEBUG_IVAR(right);
      }

      if (left < right) {
        LOG_SORT_DEBUG("left is less than right");
        LOG_SORT_DEBUG("swapping lines between left and right");
        data_swap(data, left, right);
      }
    }

    LOG_SORT_DEBUG("swapping lines between start and right");
    data_swap(data, start, right);

    LOG_SORT_DEBUG("Recursive quicksort between start and right - First partition");
    sort_quicksort(data, start, right - 1);

    LOG_SORT_DEBUG("Recursive quicksort between right and end - Second partition");
    sort_quicksort(data, right + 1, end);
  }

}
