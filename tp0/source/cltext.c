#include "cltext.h"
#include <stdio.h>

/*
 * Ver documentacion en cl_args.h
 */
void cl_text_help() {
  puts("tp0 [OPTIONS] [FILE]");
  puts("-h, --help        display this help and exit");
  puts("-v, --version     display version information and exit");
  puts("-q, --quick       use the quicksort algorithm");
  puts("-s, --stooge      use the stoogesort algorithm");
}

/*
 * Ver documentacion en cl_args.h
 */
void cl_text_version() {
  puts("tpo 1.0.0");
}
