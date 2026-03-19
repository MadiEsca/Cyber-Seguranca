#! /usr/bin/env bash

#Script criado para demonstrar a utilização de Arrays

indice=$1
nome=$2
array_utilizado=("meu" "nome" "é" "${nome}." "Você" "passou" "$#" "argumentos")

echo "${array_utilizado[${indice}]}"
