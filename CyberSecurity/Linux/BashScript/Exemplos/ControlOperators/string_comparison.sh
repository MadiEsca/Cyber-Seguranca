#! /usr/bin/env bash

#Script criado para demonstrar a utilizaçõa da comparação entre Strings

nome="Marcos"

read -rp "Digite seu primeiro nome: " primeiro_nome

if [[ ${nome} == ${primeiro_nome} ]]; then
  echo "Os nomes são igualzin Zeca Urubu"
else
  echo "Os nomes não tem nada a ver"
fi
