#! /usr/bin/env bash

#Script que verifica se determinado arquivo existe, caso não exista, ele o cria

readonly data_atual=$(date +%d/%m/%y)

if [[ -f arquivo.txt ]]; then
  echo "Esse Arquivo existe rpzd"
  exit 1
else
  echo "O arquivo foi criado"
  touch arquivo.txt
  echo "Esse arquivo foi criado em: ${data_atual}" >> arquivo.txt
  exit 0
fi
