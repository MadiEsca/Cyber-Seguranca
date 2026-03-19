#! /usr/bin/env bash

#Script criado para demonstrar a diferença entre o until e o while, utilizando como base o mesmo código

Arquivo="while_text.txt"

touch "$Arquivo"

while [[ -s ${Arquivo} ]]; do
  echo "Arquivo vazio"
  echo "Verificando novamente"
  sleep 2
done

echo "Arquivo preenchido"
echo "Conteúdo: $(cat "${Arquivo}")"
