#!/bin/bash
echo
echo
echo "***********************************************************************"
echo "[TEST] Correr un archivo de texto chico de test con algoritmo de Stooge"
echo "***********************************************************************"
test/exec_tp0.sh -s test/short_lines.txt;
exit $?;
