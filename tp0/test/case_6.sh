#!/bin/bash
echo
echo
echo "**************************************************************************"
echo "[TEST] correr un archivo binario chico de test con algoritmo de stoogesort"
echo "**************************************************************************"
test/exec_tp0.sh -s test/binary > /dev/null
exit $?;
