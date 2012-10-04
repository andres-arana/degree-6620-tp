#!/bin/bash
FILE=$1;
COMPARE_FILE=$2;
ORIGINAL_SIZE=$(ls -l $FILE | cut -f5 -d\ );
TESTCOMPARE_AUX_SIZE=$(ls -l $COMPARE_FILE | cut -f5 -d\ );
rm $COMPARE_FILE;
if [ $ORIGINAL_SIZE -ne $TESTCOMPARE_AUX_SIZE ]
then
  echo "[ERROR] Los tamaños no son iguales $FILE [$ORIGINAL_SIZE] mientras salida [$TESTCOMPARE_SIZE]"
  exit 1;
fi
exit 0;
