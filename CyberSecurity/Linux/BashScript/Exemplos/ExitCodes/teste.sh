#!/bin/bash
set -euo pipefail # Errexit, Nounset, Pipefail

readonly E_NOT_FOUND=64

cleanup() {
    # Garante que estados intermediários sejam limpos [30]
    rm -f /tmp/lock.$$
}
trap cleanup EXIT # Executa ao terminar, com sucesso ou erro [36, 42]

main() {
    # Lógica de sistema aqui...
    if ! ls; then
        exit "$E_NOT_FOUND" # Exit code semântico [18, 43]
    fi
}

main "$@" # Passagem atômica de argumentos [44, 45]
