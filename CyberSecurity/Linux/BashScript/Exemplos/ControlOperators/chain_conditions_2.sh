#! /usr/bin/env bash

#Validando comandos

DIR_NAME="Teste"

mkdir ${DIR_NAME}

if [[ -f ${DIR_NAME} ]] || [[ -d ${DIR_NAME} ]]; then
  echo "O ${DIR_NAME} é um arquivo ou um diretório"
fi
