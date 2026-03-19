#! /usr/bin/env bash

# Criando um array
NOME_COMPLETO=("Marcos" "Vinicius" "Rodrigues" "Soares")

#Todos os elementos do array
echo "${NOME_COMPLETO[*]}"

#Apenas um elemnto do array
echo "${NOME_COMPLETO[2]}"

#Apagando o valor de um elemenro do array
unset NOME_COMPLETO[2]
echo "O seguinte array não existe: ${NOME_COMPLETO[2]}"

#Sobreescrendo um elemento do array
NOME_COMPLETO[2]="Sobreescrito mané"
echo "O seguinte elemento foi sobreescrito: ${NOME_COMPLETO[2]}"

#Criando um elemento dentro do array
NOME_COMPLETO[4]="Novo elemento"
echo "O seguinte elemento foi criado: ${NOME_COMPLETO[4]}"
