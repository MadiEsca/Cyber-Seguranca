# Primeiro desafio - Processos e IPC

Aqui vai um desafio com sabor real de sistemas Unix. A ideia é construir um pequeno “mini-serviço” usando apenas **bash, sinais e pipes**. Nada de ferramentas pesadas. Apenas os mecanismos fundamentais que fazem o Unix respirar.

A proposta é criar um **monitor de tarefas controlado por sinais**, onde um processo principal recebe comandos por um **pipe nomeado (FIFO)** e reage a **sinais do sistema** para mudar seu comportamento.

Pense nisso como um embrião de um *daemon*.

------

Primeiro, o objetivo do desafio.

Você deverá criar um script chamado:

```
monitor.sh
```

Ele funcionará como um processo que:

- recebe comandos através de um **pipe**.
- responde a **sinais Unix**.
- mantém um **contador interno**.
- registra eventos em um **arquivo de log**.

------

O comportamento esperado é o seguinte.

Quando iniciado, o script deve:

1. Criar um **pipe nomeado**

```
/tmp/controle_monitor
```

1. Criar um arquivo de log

```
monitor.log
```

1. Iniciar um **loop infinito** aguardando comandos pelo pipe.

------

Os comandos enviados ao pipe devem ser:

```
incrementar
status
reset
sair
```

Cada comando altera o estado interno do script.

Comportamento esperado:

**incrementar**

aumenta um contador interno e registra no log.

Exemplo no log:

```
[INFO] contador incrementado: 5
```

------

**status**

escreve no log o valor atual do contador.

------

**reset**

zera o contador.

------

**sair**

encerra o script de forma limpa.

------

Agora entra a parte interessante: **sinais do sistema**.

Seu script deve tratar três sinais.

```
SIGUSR1
```

Quando receber esse sinal:

- imprimir no log

```
[EVENTO] sinal SIGUSR1 recebido
```

- incrementar automaticamente o contador.

------

```
SIGHUP
```

Simula recarregamento de configuração.

Quando recebido:

```
[EVENTO] recarregando configuração
```

(para simplificar, apenas registrar no log)

------

```
SIGINT
```

Esse deve **encerrar o programa corretamente**, removendo o pipe criado.

------

Agora entra o uso do **pipe**.

Em outro terminal você poderá enviar comandos assim:

```
echo incrementar > /tmp/controle_monitor
```

ou

```
echo status > /tmp/controle_monitor
```

------

Você também deve conseguir controlar o processo via sinais.

Primeiro descubra o PID:

```
ps aux | grep monitor.sh
```

Depois envie sinais:

```
kill -USR1 PID
```

ou

```
kill -HUP PID
```

------

Resultado esperado no log:

```
[INFO] contador incrementado: 1
[INFO] contador incrementado: 2
[EVENTO] sinal SIGUSR1 recebido
[INFO] contador incrementado: 3
[EVENTO] recarregando configuração
```

------

Algumas restrições do desafio (importantes):

1. Use **trap** para tratar sinais.
2. Use **mkfifo** para criar o pipe.
3. Use **while read** para consumir o pipe.
4. O script não pode travar se ninguém estiver escrevendo no pipe.

------

Estrutura mínima esperada do script (apenas esqueleto):

```bash
#!/bin/bash

PIPE="/tmp/controle_monitor"
LOG="monitor.log"
contador=0

# criar pipe
mkfifo "$PIPE"

# traps de sinais

# loop principal lendo pipe
while read comando
do
   case "$comando" in
      incrementar)
      ;;
      status)
      ;;
      reset)
      ;;
      sair)
      ;;
   esac
done < "$PIPE"
```

------

Se quiser elevar o nível do desafio (versão usada em entrevistas de engenharia de sistemas):

Implemente também:

- **SIGTERM** → encerramento gracioso
- **timeout automático** se nenhum comando chegar por 60s
- **múltiplos clientes escrevendo no pipe**

Isso começa a parecer perigosamente com a arquitetura de um **daemon Unix real**.

E aqui está um pequeno insight curioso do mundo real:
muitos serviços históricos do Linux — incluindo partes antigas do **syslog e servidores de impressão** — começaram exatamente com essa filosofia simples:

**pipes + sinais + loops.**

Pequenas engrenagens Unix, combinadas de forma elegante.

Se quiser, posso também propor a **versão nível hacker desse desafio**, onde você transforma esse script em um **C2 simples (Command and Control)** usando pipes e sinais — um exercício excelente para entender como alguns malwares Unix funcionam internamente.