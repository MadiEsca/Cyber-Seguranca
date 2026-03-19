#! /usr/bin/env bash

#Script criado para exemplificar a utilização de inputs dentro de Bash Scripts

#echo "Digite seu nome: "
read -rp "Digite seu nome: " nome

#echo "Digite seu sobrenome: "
read -rp "Digite seu sobrenome: " sobrenome

#echo "Digite sua senha"
read -rsp "Digite sua senha: " senha 

echo "" #"quebra" a linha

cowsay -r -e "@@" "Olá ${nome}, sua senha atual é: ${senha}"

