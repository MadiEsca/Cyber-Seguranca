#! /usr/bin/env bash

PIPE="/tmp/controle_monitor"
LOG="monitor.log"
contador=0
rodando=true

#Função de log
log(){
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG"
}

# Criar pipe se não existir
if [ ! -p "$PIPE" ]; then
  mkfifo "$PIPE"
fi

log "[INFO] Monitor iniciado (PID $$)"

# ---------- Tratamento de sinais ----------

trap '
log "[EVENTO] SIGUSR1 recebido"
((contador++))
log "[INFO] contador incrementado: $contador"
' SIGUSR1

trap '
log "[EVENTO] recarregando configuração (SIGHUP)"
' SIGHUP

trap '
log "[EVENTO] encerramento solicitado (SIGINT)"
rodando=false
' SIGINT

trap '
log "[EVENTO] encerramento gracioso (SIGTERM)"
rodando=false
' SIGTERM

# ---------- Loop principal ----------

while $rodando
do
if read -t 1 comando < "$PIPE"; then
case "$comando" in

  incrementar)
    ((contador++))
            log "[INFO] contador incrementado: $contador"
        ;;

        status)
            log "[INFO] status atual do contador: $contador"
        ;;

        reset)
            contador=0
            log "[INFO] contador resetado"
        ;;

        sair)
            log "[INFO] comando sair recebido"
            rodando=false
        ;;

        *)
            log "[ERRO] comando desconhecido: $comando"
        ;;
    esac
fi

done

# ---------- Limpeza ----------

rm -f "$PIPE"
log "[INFO] monitor finalizado"
exit 0

