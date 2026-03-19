#! /usr/bin/env bash

#Script criado para verificar se determinado arquivo de texto tem algum conteúdo

ARQUIVO="until_text.txt"

touch "${ARQUIVO}"

until [[ -s ${ARQUIVO} ]]; do
  echo "O arquivo está vazio"
  echo "Verificando o conteúdo novamente"
  sleep 2
done

echo "O arquivo foi preenchido com conteúdo"
echo "Conteúdo: $(cat "${ARQUIVO}")"
