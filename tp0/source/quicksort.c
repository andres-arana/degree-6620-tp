#include <stdio.h>
#include <string.h>
#include "quicksort.h"
#include "config.h"

int select_pivot(int start, int end) {
  return (start + ((end - start) / 2));
}

void print_data(struct data_t* data) {
  LOG_SORT_DEBUG(" == START PRINTING DATA ==");
  int i;
  for (i = 0; i < data->size; i++) {
    LOG_SORT_DEBUG_SVAR((data->table)[i]);
  }
  LOG_SORT_DEBUG(" == END PRINTING DATA ==");
}


void swap_lines(struct data_t* data, int position_line1, int position_line2) {
  char* temp = (data->table)[position_line1];
  LOG_SORT_DEBUG("line2 should be before line1");
  (data->table)[position_line1] = (data->table)[position_line2];
  (data->table)[position_line2] = temp;
  #ifdef LOG_LEVEL_DEBUG_SORT
  print_data(data);
  #endif
}

void sort_quicksort(struct data_t* data, int start, int end) {
  LOG_SORT_DEBUG("Executing quicksort sort");
  LOG_SORT_DEBUG_IVAR(start);
  LOG_SORT_DEBUG_IVAR(end);
  char* key;
  int left = 0;
  int right = 0;
  int pivot_position = 0;
  
  if (start < end) {
    LOG_SORT_DEBUG("start is less than end");
    pivot_position = select_pivot(start, end);
    LOG_SORT_DEBUG_IVAR(pivot_position);

    LOG_SORT_DEBUG("swapping lines between start and pivot_position");
    swap_lines(data, start, pivot_position);

    key = (data->table)[start];
    LOG_SORT_DEBUG_SVAR(key);

    left = start + 1;
    LOG_SORT_DEBUG_IVAR(left);

    right = end;
    LOG_SORT_DEBUG_IVAR(right);

    while (left <= right) {
      LOG_SORT_DEBUG("left is less or equals than right");

      while ((left <= end) && (strcmp((data->table)[left], key) <= 0)) {
        LOG_SORT_DEBUG_SVAR((data->table)[left]);
        LOG_SORT_DEBUG("left is less or equals than end and compare_key is less or equals than key");
        left++;
        LOG_SORT_DEBUG_IVAR(left);
      }

      while ((right >= start) && (strcmp((data->table)[right], key) > 0)) {
        LOG_SORT_DEBUG_SVAR((data->table)[right]);
        LOG_SORT_DEBUG("right is greater or equals than start and compare_key is greater than key");
        right--;
        LOG_SORT_DEBUG_IVAR(right);
      }

      if (left < right) {
        LOG_SORT_DEBUG("left is less than right");
        LOG_SORT_DEBUG("swapping lines between left and right");
        swap_lines(data, left, right);
      }
    }

    LOG_SORT_DEBUG("swapping lines between start and right");
    swap_lines(data, start, right);

    LOG_SORT_DEBUG("Recursive quicksort between start and right - First partition");
    sort_quicksort(data, start, right - 1);

    LOG_SORT_DEBUG("Recursive quicksort between right and end - Second partition");
    sort_quicksort(data, right + 1, end);
  }

}
