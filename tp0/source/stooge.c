#include <stdio.h>
#include <string.h>
void LOG_1(const char* format, void* cadena);
void stooge_expand(char** array, int start, int end);
void stooge(char** array);
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
int main(int argc, char** argv) {
  char* array[] = {"hola", "buenas", "dia", "olala"};
  int i = 0;
  for (i = 0; i < 4; i++) {
    LOG_1("%s \n", array[i]);
  }
  puts("Empieza Stooges");
  stooge(array);
  puts("Termino Stooges");

  for (i = 0; i < 4; i++) {
    LOG_1("%s \n", array[i]);
  }
  LOG_1("%s \n", "====fin====");
}


void stooge(char** array) {
  stooge_expand(array, 0, 3);
}

/**
 * Sort array in using stooge algorithm.
 */
void stooge_expand(char** array, int start, int end) {
  if (end < 0) {
    puts("  End is 0");
    end = (sizeof(array)/sizeof(char*)) - 1;
  }
  char* line1 = array[start];
  char* line2 = array[end];
  LOG_1("  line 1: \"%s\" \n", line1);
  LOG_1("  line 2: \"%s\" \n", line2);
  if (is_menor(array[end], array[start]) < 0) {
      puts("  line2 es menor que linea 1");
      array[start] = array[end];
      array[end] = line1;
  }
  if (end - start + 1 >= 3) {
    int next_end = (end - start + 1) / 3;
    LOG_1("  Next end: %d \n", next_end);
    LOG_2("  Stooge [start=%d;end=%d] \n", start, end - next_end);
    stooge_expand(array, start, end - next_end);
    LOG_2("  Stooge [start=%d;end=%d] \n", start + next_end, end);
    stooge_expand(array, start + next_end, end);
    LOG_2("  Stooge [start=%d;end=%d] \n", start, end - next_end);
    LOG_2("  Stooge [start=%d;end=%d] \n", start, end - next_end);
  }
}

int is_menor(char* line1, char* line2) {
  return strcmp(line1, line2);
}

