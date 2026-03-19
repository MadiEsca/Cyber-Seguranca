#! /usr/bin/env bash

#Script que recebe uma senha (argumento) e a compara com um valor prévio

senha_correta="raquelly"
senha_digitada=${1}

echo "Vamos verificar se você digitou a senha correta..."

[[ "$senha_digitada" == "$senha_correta" ]] && cowsay "deu certo" || cowsay "Deu erro menor"
