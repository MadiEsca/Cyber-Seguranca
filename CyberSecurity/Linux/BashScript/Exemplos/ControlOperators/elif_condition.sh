#! /usr/bin/env bash

#Script criado para mostrar o funcionamento do comando elif

USER_INPUT=${1} #Pega o primeiro argumento

#=== Verificando se apenas um argumento foi passado ===
#Verificando se mais de argumento foi passado
if [[ ${#} > 1 ]]; then
  echo "Muitos argumentos foram passados"
  echo "${#}"
  exit 1
#Verificando se nenhum argumento foi passado
elif [[ -z ${USER_INPUT} ]]; then
  echo "Nenhum argumento foi passado"
  exit 1
fi

#Lógica para o funcionamento do Script
if [[ -f ${USER_INPUT} ]]; then
  echo "O input do usuário é um arquivo"
elif [[ -d ${USER_INPUT} ]]; then
  echo "O input do usuário é um diretório"
else
   echo "O input do usuário é uma String"
fi
