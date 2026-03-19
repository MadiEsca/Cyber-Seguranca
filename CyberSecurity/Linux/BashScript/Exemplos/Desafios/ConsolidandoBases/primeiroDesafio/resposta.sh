#!/usr/bin/env bash
set -euo pipefail

# =========================
# Constantes
# =========================
RED='\033[0;31m'
RESET='\033[0m'

readonly E_NOT_ROOT=10
readonly E_BAD_ARGS=20
readonly E_BAD_FILE=30
readonly E_BAD_NUMBER=40

# =========================
# Variáveis de runtime
# =========================
TMP_FILE=""

# =========================
# Cleanup garantido
# =========================
cleanup() {
  [[ -n "${TMP_FILE}" ]] && rm -f "${TMP_FILE}"
}
trap cleanup EXIT

# =========================
# Validações
# =========================
validate_root() {
  if [[ "${EUID}" -ne 0 ]]; then
    echo -e "${RED}ERRO: script deve ser executado como root${RESET}" >&2
    exit "${E_NOT_ROOT}"
  fi
}

validate_args_quantity() {
  if [[ $# -ne 2 ]]; then
    echo -e "${RED}ERRO: uso correto: $0 <arquivo> <numero>${RESET}" >&2
    exit "${E_BAD_ARGS}"
  fi
}

validate_file() {
  local file="$1"

  if [[ ! -e "${file}" ]]; then
    echo -e "${RED}ERRO: arquivo não existe${RESET}" >&2
    exit "${E_BAD_FILE}"
  fi

  if [[ ! -f "${file}" ]]; then
    echo -e "${RED}ERRO: caminho não é um arquivo regular${RESET}" >&2
    exit "${E_BAD_FILE}"
  fi

  if [[ ! -r "${file}" ]]; then
    echo -e "${RED}ERRO: arquivo não possui permissão de leitura${RESET}" >&2
    exit "${E_BAD_FILE}"
  fi
}

validate_number() {
  local number="$1"

  if [[ ! "${number}" =~ ^[1-9][0-9]*$ ]]; then
    echo -e "${RED}ERRO: o segundo argumento deve ser um número inteiro positivo${RESET}" >&2
    exit "${E_BAD_NUMBER}"
  fi
}

# =========================
# Lógica principal
# =========================
main() {
  validate_root
  validate_args_quantity "$@"

  local file="$1"
  local times="$2"

  validate_file "${file}"
  validate_number "${times}"

  TMP_FILE="/tmp/output.$$"

  for ((i = 1; i <= times; i++)); do
    cat "${file}" >> "${TMP_FILE}"
  done

  echo "Arquivo gerado com sucesso:"
  echo "${TMP_FILE}"
}

main "$@"

