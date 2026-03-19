#! /usr/bin/env bash
set -euo pipefail

#Script criado para consolidar meus conhecimentos em Bash Script
#
#
#
# Função do Script:
# - Solicitar o caminho de um arquivo para o usuário como primeiro parâmetro
# - Solicitar o número de vezes que o usuário quer repetir o conteúdo desse arquivo como segundo parâmetro
# - Gravar o resultado do Script em um arquivo temporário
# - Mostrar onde o arquivo foi gerado
#
#
# Funcionalidades do Script:
# - Verificação de usuário root
# - Validação da quantidade de argumentos passados
# - Validação dos argumentos passados
# - Criação de um arquivo de log para armazenar as mensagens de execução do Script
#
# Falta:
# - Refatorar o código
# - Fazer com que as funções recebam argumentos (FIRST_PARAMETER e SECOND_PARAMETER) ao invés de serem variáveis globais
# - Utilizar o comando Trap

#Definindo o código das cores - Utilizadas com o echo -e
RED='\033[0;31m'

#Definindo as variáveis globais
QUANTIDADE_DE_ARGUMENTOS="${#}"
FIRST_PARAMETER="${1}"
SECOND_PARAMETER="${2}"

#Criação do arquivo de log
DATA_ATUAL=$(date +%d_%m_%Y_%H%M%S)
CAMINHO_ARQUIVO_LOG="arquivo.${DATA_ATUAL}.log"
touch ${CAMINHO_ARQUIVO_LOG}

#Validando usuário root
RootValidation ()
{
  if [[ "${UID}" -eq 0 ]]; then #Verifica se o User ID do usuário é 0 (Usuário Root) 
    echo "Você tem permissão de execução" >> "${CAMINHO_ARQUIVO_LOG}"
    return 0
  else
    echo -e "${RED}ERRO! Você não tem permissão para executar esse script" >> "${CAMINHO_ARQUIVO_LOG}"
    echo "Consulte para mais infomações: ${CAMINHO_ARQUIVO_LOG}"
    exit 1
  fi
}

#Validando a quantidade de parâmetros passados
ParametersQuantitiesValidation()
{
  if [[ "${QUANTIDADE_DE_ARGUMENTOS}" -eq 2 ]]; then
    echo "Quantidade correta de parâmetros passados" >> "${CAMINHO_ARQUIVO_LOG}"
    return 0
  else
    echo "Quantidade incorreta de argumentos" >> "${CAMINHO_ARQUIVO_LOG}"
    echo "Consulte para mais infomações: ${CAMINHO_ARQUIVO_LOG}"
    exit 1
  fi
}

#Validação do primeiro argumento
FirstParameterValidation()
{
  if [[ -f "${FIRST_PARAMETER}" ]] && [[ -r "${FIRST_PARAMETER}" ]]; then
    echo "Arquivo válido" >> "${CAMINHO_ARQUIVO_LOG}"
    return 0
  else
    echo "Arquivo inválido, selecione outro"
    exit 1
  fi
}

#Validação do segundo argumento
SecondParameterValidation()
{
  if [[ ${SECOND_PARAMETER} -gt 0 ]]; then
    echo "Segundo argumento: Válido"
    return 0
  else
    echo "Insira um número válido - Superior a 0"
    exit 1
  fi
}

#Lógica principal do Script
if RootValidation && ParametersQuantitiesValidation; then
  if FirstParameterValidation && SecondParameterValidation; then
    for ((i = 0; i < "${SECOND_PARAMETER}" ; i++)); do
      echo "${FIRST_PARAMETER}"
    done
    
  fi
fi
