#!/bin/bash
echo
echo
echo "**************************************************************************"
echo "[TEST] correr un archivo de texto chico de test con algoritmo de Quicksort"
echo "**************************************************************************"
test/exec_tp0.sh -q test/short_lines.txt;
exit $?;
