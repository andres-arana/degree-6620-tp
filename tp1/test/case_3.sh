#!/bin/bash
echo
echo
echo "*****************************************************************"
echo "[TEST] Validacion de que help y version no se pueden pedir juntas"
echo "*****************************************************************"
build/tp0 -h -v
RETURN=$?;
if [ $RETURN -eq 1 ]; then
  exit 0;
fi
