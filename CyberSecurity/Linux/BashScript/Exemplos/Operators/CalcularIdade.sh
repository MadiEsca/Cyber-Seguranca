#! /usr/bin/env bash

#Script para demonstrar a utilização dos operadores aritméticos de diferentes formas

#Utilizando o comando let 
echo "Utilizando o let"
#Habilitando o Debug #set -x
let idade="2025 - 2008"
echo "Você tem ${idade} anos"
unset idade
#set +x

#Utilizando a sintaze double parenthesis
echo "Utilizando o double parenthesis"
idade=$(( 2025 - 2008 ))
echo "Você tem ${idade} anos"
unset idade

#Utilizando o comando expr
echo "Utilizando o comando expr"
idade=$(expr 2025 - 2008)
echo "Você tem ${idade} anos"
