#!/usr/bin/env bash
#set -euo pipefail

#
# Script: auditoria_basica.sh
#
# Descrição:
#   Script em Bash para realizar uma auditoria básica de segurança em arquivos
#   e diretórios do sistema, com foco em validações iniciais e boas práticas.
#
# Funcionalidades:
#   - Verificar se o script está sendo executado como usuário root - ok
#   - Validar a quantidade e o tipo de argumentos fornecidos - ok
#   - Verificar existência, tipo e permissões de arquivos/diretórios
#   - Analisar permissões consideradas inseguras
#   - Gerar logs da execução do script
#   - Exibir mensagens de erro claras e informativas - ok
#
# Requisitos:
#   - Sistema Linux/Unix
#   - Bash versão 4 ou superior
#   - Permissões de root para execução
#
# Uso:
#   ./auditoria_basica.sh <caminho> <arquivo_log>
#

# Definindo as cores que serão utilizadas
#   - Vermelho = \e[31m
#   - Sublinhado = \e[4;m
#   - Vermelho Sublinhado = \e[4;31m
#
RED='\033[7;1;31m' #Fundo vermelho(7) texto bold(1) cor vermelha(32)
UNDERLINE='\033[4;m'
RED_UNDERLINE='\033[4;31m'

#Funções de inicialiação
root_verification() #Lógica responsável por verificar se quem executou o programa tem privilégios de administrador
{
  local USER="$(whoami)"

  if [[ "${EUID}" -ne 0 ]]; then
    echo -e "${RED}ERRO! o usuario "${USER}" não tem permissão para executar o Script"
    exit 1
  fi
}

arguments_verification() #Lógica responsável por verificar se os argumentos foram passados de forma correta
{
  local ARGUMENTS_QUANTITY="${#}"
  if [[ -z "${1}" ]]; then
    echo -e "${RED}ERRO! Nenhum argumento foi passado"
    exit 1
  elif [[ "${ARGUMENTS_QUANTITY}" -gt 1 ]]; then
    echo -e "${RED}ERRO! Quantidade exessiva de argumentos"
    exit 1
  fi
}

#Funções de Funcionalidades
usuarios() #Lista todos os usuários do sistema e identifica usuarios root
{
  declare -a USERS_LIST #array que armazenará os usuários
  for USERS in $(cat /etc/passwd)
  do
    USERS_LIST+="${USERS}\n" # Passa todos os usuários encontrados para dentro do array, adicionando uma quebra de linha
  done

  echo -e "${USERS_LIST}"
}

option_select()
{
  local OPTION="$1"

  case "${OPTION}" in
    "usuarios")
      usuarios
    ;;
    "permissoes") 
      echo "permissoes"
    ;;
    "processos") 
      echo "processos"
    ;;
    *) 
      echo -e "${RED}Argumento invalido"
      exit 1
  esac
  
}

main()
{
  if root_verification && arguments_verification "$@"; then
    #echo -e "\e[7;1;32mTudo certo\e[0m"
    option_select $1
  fi
}

main "$@"
