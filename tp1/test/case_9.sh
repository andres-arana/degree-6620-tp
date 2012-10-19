#!/bin/bash
echo
echo
echo "************************************************************************************"
echo "[TEST] correr todos los archivos de texto dentro de test/ con algoritmo de quicksort"
echo "************************************************************************************"
for file in test/*.txt
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
echo "[TEST] Fueron corridos todos los archivos de test con algoritmo quicksort"
