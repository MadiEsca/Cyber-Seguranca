#!/bin/bash
#Verificando a existência de um arquivo e se ele não é vazio

echo "Hello World!" > file.txt
if [[ -f "file.txt" ]] && [[ -s "file.txt" ]]; then
  echo "O arquivo existe e não está vazio."
fi
