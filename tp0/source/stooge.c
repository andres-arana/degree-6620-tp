#include <stdio.h>
#include <string.h>
#include "stooge.h"
void LOG_1(const char* format, void* cadena);
void sort_stooge(struct data_t* data, int start, int end);
int is_menor(char* line1, char* line2);
#ifndef NULL
  #define NULL 0
#endif
#ifndef DEBUG
  #define DEBUG 1
#endif

#ifndef LOG_1
  #ifdef DEBUG
    #define LOG_1(FORMATO, CADENA) printf(FORMATO, CADENA)
  #else
    #define LOG_1(FORMATO, CADENA)
  #endif
#endif

#ifndef LOG_2
  #ifdef DEBUG
    #define LOG_2(FORMATO, CADENA1, CADENA2) printf(FORMATO, CADENA1, CADENA2)
  #else
    #define LOG_2(FORMATO, CADENA1, CADENA2)
  #endif
#endif


/**
 * Main test
 */
/*int main(int argc, char** argv) {*/
  /*struct data_t* data_test;*/
  /*char* array[] = {"hola", "buenas", "dia", "olala"};*/
  /*data_test->table = array;*/
  /*data_test->size = 4;*/
  /*int i = 0;*/
  /*for (i = 0; i < 4; i++) {*/
    /*LOG_1("%s \n", data_test->table[i]);*/
  /*}*/
  /*puts("Empieza Stooges");*/
  /*sort_stooge(data_test, 0, data_test->size - 1);*/
  /*puts("Termino Stooges");*/

  /*for (i = 0; i < data_test->size; i++) {*/
    /*LOG_1("%s \n", data_test->table[i]);*/
  /*}*/
  /*LOG_1("%s \n", "====fin====");*/
/*}*/


void sort_stooge(struct data_t* data, int start, int end) {
  if (end < 0) {
    puts("  End is 0");
    end = data->size - 1;
  }
  char* line1 = (data->table)[start];
  char* line2 = (data->table)[end];
  LOG_1("  line 1: \"%s\" \n", line1);
  LOG_1("  line 2: \"%s\" \n", line2);
  if (is_menor((data->table)[end], (data->table)[start]) < 0) {
      puts("  line2 es menor que linea 1");
      (data->table)[start] = (data->table)[end];
      (data->table)[end] = line1;
  }
  if (end - start + 1 >= 3) {
    int next_end = (end - start + 1) / 3;
    LOG_1("  Next end: %d \n", next_end);
    LOG_2("  Stooge [start=%d;end=%d] \n", start, end - next_end);
    sort_stooge(data, start, end - next_end);
    LOG_2("  Stooge [start=%d;end=%d] \n", start + next_end, end);
    sort_stooge(data, start + next_end, end);
    LOG_2("  Stooge [start=%d;end=%d] \n", start, end - next_end);
    sort_stooge(data, start, end - next_end);
  }
}

int is_menor(char* line1, char* line2) {
  return strcmp(line1, line2);
}

