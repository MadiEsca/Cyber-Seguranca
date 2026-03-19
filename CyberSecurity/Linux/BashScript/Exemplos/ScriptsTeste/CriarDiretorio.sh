#! /usr/bin/env bash

#Script que cria um diretório com o nome especificado pelo usuário
#$1 -> Indica o primeiro parâmetro passado para o script

novo_diretorio=$1
mkdir ${novo_diretorio}
echo "Diretorio criado"
