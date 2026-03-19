#! /usr/bin/env bash

NOME="Marcos"

print_nome(){
  local SOBRENOME
  SOBRENOME="Rodrigues"
  echo "Seu nome é: ${NOME} e seu sobrenome é: ${SOBRENOME}"
}

print_nome

echo "A variável ${NOME} não será exibida, pois é local da função print_nome"
