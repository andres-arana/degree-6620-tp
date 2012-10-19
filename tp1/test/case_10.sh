#!/bin/bash
echo
echo
echo "***************************************************************************"
echo "[TEST] correr todos los archivos que no son *.sh con algoritmo de quicksort"
echo "***************************************************************************"
for file in $(ls test/* | grep -v "\.sh$")
do
  echo
  echo "[TEST] Procesando archivo $file"
  test/exec_tp0.sh -q $file > /dev/null
  if [ $? -ne 0 ]
  then
    exit 1;
  fi
done
echo;
echo "[TEST] Fueron corridos todos los archivos de test que no son ejecutables con algoritmo quicksort";
