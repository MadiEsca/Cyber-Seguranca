#! /usr/bin/env bash

#Script criado para demonstrar a utilização de funções

imprimir_texto(){
  local primeiro_argumento=${1}
  local segundo_argumento=${2}
  terceiro_argumento=${3}
  echo "Primeiro: ${primeiro_argumento}, Segundo: ${segundo_argumento}, Terceiro: ${terceiro_argumento}"
}

#imprimir_texto raquelly é chatolina #Passando os argumentos diretamente para a função
#imprimir_texto "$@" #Os argumentos passados para o script são passados para a função
mensagem=$(imprimir_texto "$@") #Atribuindo a função e os valores do argumentos a uma variável
echo "Mensagem: ${mensagem}"
