#! /usr/bin/env bash

#Código criado para exemplificar os exit codes
set -x
ls -l . > /dev/null
set +x

echo ""
echo "Exit code: ${?}"
echo ""

set -x
lzl . &> /dev/null
set +x

echo ""
echo "Exit code: ${?}"
