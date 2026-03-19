#! /usr/bin/env bash

#Listando os arquivo que podem ser escritos dentro de um diretório passado como argumento

DIRETORIO="${1}"
#USUARIO="$(whoami)"

for file in $(ls ${DIRETORIO}); do 
  if [[ -w ${file} ]]; then
    echo "Editável: ${file}"
  else
    echo "Não editável: ${file}"
  fi
  sleep 1
done

echo "diretório escaneado com sucesso"
