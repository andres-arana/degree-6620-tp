#include "cltext.h"
#include <stdio.h>

/*
 * Ver documentacion en el header
 */
void cl_text_help() {
  puts("tp1 [OPTIONS] [FILE]");
  puts("-h, --help        display this help and exit");
  puts("-v, --version     display version information and exit");
  puts("-c                use the C implementation of the sorting algorithm");
}

/*
 * Ver documentacion en el header
 */
void cl_text_version() {
  puts("tp1 1.0.0");
}
