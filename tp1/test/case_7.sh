#!/bin/bash
echo
echo
echo "*************************************************************************"
echo "[TEST] correr un archivo binario chico de test con algoritmo de Quicksort"
echo "*************************************************************************"
test/exec_tp0.sh -q test/binary > /dev/null
exit $?;
