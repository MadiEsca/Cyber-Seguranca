#! /usr/bin/env bash

#Script criado para mostrar o uso dos testes de comandos

#Verifica se o comando foi executado corretamente
if [[ $(lzl 2> log.file) ]]; then
  #Executa caso a condição seja verdadeira
  echo "Esse comando funciona"
  exit 0
else
  #Executa caso a condição não seja verdadeira
  echo "O comando não funciona"
  echo "arquivo log: $(cat log.file)"
fi

#Espera 5 segundos e remove o arquivo de log que foi criado anteriormente
sleep 5
echo "removando o arquivo de log"
rm log.file
