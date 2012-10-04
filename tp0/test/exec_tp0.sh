#!/bin/bash
ARGS=$1;
FILE=$2;
COMPARE_FILE="test/testcompare_aux"
build/tp0 $ARGS $FILE | tee $COMPARE_FILE;
test/compare_size.sh $FILE $COMPARE_FILE;
exit $?;
