#! /usr/bin/env bash

#Script criado para mostrar o uso de testes em comandos

if echo "[ comando de teste ]"; then
  echo "O comando funciona: ${?}"
elif [[ lzl ]]; then
  echo "Esse é um comando que não funciona: ${?}"
fi
