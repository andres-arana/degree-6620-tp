#!/bin/bash

echo "[TEST] Validacion de que help y version no se pueden pedir juntas"

build/tp0 -h -v
