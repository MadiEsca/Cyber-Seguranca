#! /usr/bin/env bash

#Script criado para demonstrar a utilização do break
#Pode ser substituido por um loop "until" -> menos código e o mesmo resultado

FILE="arquivo_exit.txt"

while true; do
	if [[ -f ${FILE} ]]; then
		echo "Arquivo encontrado"
		echo "Parando o loop"
		break
  else
	  echo "Verificando a existência do arquivo"
	  sleep 1
  fi
done
