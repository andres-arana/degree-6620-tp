#!/bin/bash
echo
echo
echo "*************************************************************************************"
echo "[TEST] correr todos los archivos de texto dentro de test/ con algoritmo de stoogesort"
echo "*************************************************************************************"
for file in test/*.txt
do
  echo
  echo "[TEST] Procesando archivo $file"
  build/tp0 -s $file;
done
echo;
echo "[TEST] Fueron corridos todos los archivos de test con algoritmo stoogesort"
