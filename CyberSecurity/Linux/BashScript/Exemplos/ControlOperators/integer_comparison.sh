#! /usr/bin/env bash

#Script criado para demonstrar as comparações entre números

read -p "Digite um número: " numero_usuario
readonly numero_padrao=50


if [[ ${numero_usuario} -eq ${numero_padrao} ]]; then
  echo "Os números são iguais"
else
  echo "${numero_usuario} não é igual a ${numero_padrao}"
fi
