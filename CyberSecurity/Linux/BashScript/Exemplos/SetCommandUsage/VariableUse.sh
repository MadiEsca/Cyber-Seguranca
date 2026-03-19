#! /usr/bin/env bash

#Script criado para demonstrar o uso de variáveis em Scripts bash
nome="Marcos"
sobrenome="Soares"
diretorio_root=$(ls -ld /)

echo "Seu nome é ${nome} e seu sobrenome é ${sobrenome}"
echo "O diretorio root é: ${diretorio_root}"

#Desatribuindo uma variável
unset nome
echo "Seu nome é ${nome} e seu sobrenome é ${sobrenome}"
