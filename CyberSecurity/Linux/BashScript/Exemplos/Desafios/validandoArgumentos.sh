#! /usr/bin/env bash

#Script criado para verificar se dois números são iguais

#Definindo o código das cores - Utilizadas com o echo -e 
RED='\033[0;31m'

#Mensagens
#echo "Compare dois números e veja qual o maior" | cowsay -f eyes | lolcat -at -d 6

#=== Verificando se algum argumento foi passado ===

INPUT_1=${1} #Primeiro argumento passado
INPUT_2=${2} #Segundo argumento passado
QUANTIDADE_ARGUMENTOS=${#} #Quantidade total de argumentos passados
COWSAY_ANIMAL="sus"

#Função para verificar se o usuário é root
verificar_root(){
  if [[ "${EUID}" -eq "0" ]]; then
    #echo "Você é um usuário root"
    return 0
  else
    #echo "Você não é um usuário root"
    return 1
  fi
}

#Lógica da verificação
verificar_quantidade_argumentos() { 
  if [[ -z ${INPUT_1} ]] || [[ -z ${INPUT_2} ]]; then
    echo -e "${RED}ERRO: Insira todos os argumentos"
    return 1
    #exit 1
  elif [[ ${QUANTIDADE_ARGUMENTOS} -gt 2 ]]; then
    echo -e "${RED}ERRO: Argumentos demais foram passados"
    return 1
    #exit 1
  fi
}

#Lógica da comparação entre os números
verificar_numeros(){
  if [[ ${INPUT_1} -gt ${INPUT_2} ]]; then
    echo " ${INPUT_1} é maior que ${INPUT_2} "
  elif [[ ${INPUT_1} -lt ${INPUT_2} ]]; then
    echo " ${INPUT_1} é menor que ${INPUT_2} "
  else
    echo "Os números são iguais"
  fi
}
if verificar_root; then 
  echo "Compare dois números e veja qual o maior" | cowsay -f "${COWSAY_ANIMAL}" | lolcat -at -d 1 
  if verificar_quantidade_argumentos; then 
    verificar_numeros 
  fi 
else
  echo "Você não pode executar esse script se torne root" | cowsay -f "${COWSAY_ANIMAL}" | lolcat -at -d 1 
  exit 1 
fi

