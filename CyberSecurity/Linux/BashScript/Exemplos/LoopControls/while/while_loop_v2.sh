#! /usr/bin/env bash

#Criando um loop que para assim que determinado arquivo é criado

ARQUIVO_DE_PARADA="parar_loop"

while [[ ! -f ${ARQUIVO_DE_PARADA} ]]; do
  echo "Arquivo de parada não encontrado..."
  echo "Executando loop novamente"
  sleep 2 #Indica uma pausa de 2 segundos entre cada execução
done

echo "Arquivo encontrado..."
echo "Parando o loop..."
