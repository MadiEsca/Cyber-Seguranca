# Sockets Linux - Introdução

Conceitos básicos relacionados a técnicas e mecanismos de comunicação entre processos.

## Processos

- É simplesmente um programa em execução. Todas as aplicações executadas dentro de um **sistema operacional** se tornam um processo
- Cada processo tem seu **endereço de memória reservado**, onde pode *trabalhar* e *processar* suas informações.
- Dentro do sistema operacional, os processos são organizados em uma estrutura interna, dentro de uma **tabela de processos**. Essa tabela armazena informações sobre os processos que estão sendo executados dentro do sistema. A principal informação na tabela é o *ID*, que assinala uma identidade única ao processo. Portanto, qualquer ação que precise ser tomada em relação ao processo, é realizada através desse *ID*.

- Apesar de processos serem **programas em execução**, pode-se ter processos que não estão em execução, pois possuem estados que se alternam de acordo com suas necessidades ou questões relacionadas ao sistema operacional, que pode, por exemplo, necessitar que o processador realize outra ação.
  - Esse modelo de processos possui uma hierarquia. Toda vez que um processo é criado, ele é assinalado com um identificador para seu processo pai, ou seja, o processo que o originou. No Linux esse identificador é o `PPID` (*patern process identidication*)

---

## Comunicação entre processos

Já sabemos o que são os processos, agora vamos entender um pouco sobre o que é e como ocorre a comunicação entre esses processos.

- A necessidade de trocar informações entre processos executados dentro de um sistema operacional, é atendida através **comunicação entre processos**, ou ***IPC*** (*inter-process communication*).
- Não se deve restringir essa comunicação a um contexto exclusivamente local, como o próprio sistema operacional. Essa comunicação pode estar separada por quilômetros, sendo ligados por meio da rede.
- Alguns métodos de comunicação não aceitam que essas informações sejam trocadas através da rede, sendo exclusivas ao escopo local, como os *pipes*.

Os métodos ***IPC*** que serão abordados serão os seguintes: 

- Sinal
- *pipe*
- FIFO ou *named pipe*
- *Socket* - O principal

---

### Sinal

Talvez a mais simples e primordial forma de um processo receber uma mensagem, ou melhor, um estímulo.

O Sinal não envia informações para um processo, apenas comunica a um processo que uma determinada situação ou ação que deverá ser executada.

- Outra forma de entender os sinais é tratá-los como interrupções de software. 

Quando falamos sobre as ações padrões que nossos sinais podem realizar, estamos lidando com apenas cinco, sendo elas:

- **TERM** - Termina o processo
- **CORE** - Termina o processo e realiza um dump de memória
- **STOP** - O processo terá seu processamento **paralisado**
- **IGN** - O sinal será ignorado pelo processo

Mesmo que esses sinais implementem uma ação padrão, o processo pode muito bem capturar esse sinal e realizar uma outra ação, diferente do padrão. Um exemplo disso está nesse repositório.

> Mesmo que um processo receba o sinal ***SIGTERM***, que o faria terminar, ele poderá agir de uma outra forma ao receber o evento. Em específico, o sinal ***SIGTERM***, em específico é utilizado para forçar o término de um processo, mas oferece a oportunidade de realizar quaisquer tarefas que sejam necessárias, antes do processo terminar. Como por exemplo limpeza da memória utilizada, o fechamento de arquivos, e talvez comunicar outros processos (envolvidos em uma aplicação) que ele estaria sendo finalizado.

Mas, para que isso ocorra, é necessário que o processo trate esse evento, ou sinal, diretamente dentro de seu código fonte.

> Para ficar mais claro, isso significa que apesar de se ter um sinal predefinido em que se pode dizer a um processo para reler seus arquivos de configuração, nada acontecerá se não houver uma rotina presente no código-fonte, para tratar esse evento.

Vale lembrar que no Linux os sinais podem ser referenciados através de nomenclaturas ou por meio de um código.

- **TERM**

  |  Sinal  | Número |             Função             |
  | :-----: | :----: | :----------------------------: |
  | SIGHUP  |   1    | Reler arquivos de configuração |
  | SIGINT  |   2    |    Interrupção pelo teclado    |
  | SIGKILL |   9    |     Terminar imediatamente     |
  | SIGUSR1 |   10   |   Definido pelo usuário - 1    |
  | SIGUSR2 |   12   |   Definido pelo usuário - 2    |
  | SIGPIPE |   13   |         Pipe quebrado          |
  | SIGTERM |   15   |  Terminar assim que possível   |

- **CORE**

  |  Sinal  | Número |            Função             |
  | :-----: | :----: | :---------------------------: |
  | SIGQUIT |   3    |       Sair pelo teclado       |
  | SIGILL  |   4    |       Instrução ilegal        |
  | SIGABRT |   6    | Gerado pela função `abort()`  |
  | SIGFPE  |   8    |  Exceção de ponto flutuante   |
  | SIGSEGV |   11   | Referência inválida à memória |

- **STOP**

  |  Sinal  | Número |            Função             |
  | :-----: | :----: | :---------------------------: |
  | SIGSTOP |   19   |       Parar o processo        |
  | SIGTSTP |   20   | Parar o processo via terminal |

- **IGN**

  |  Sinal   | Número |                 Função                 |
  | :------: | :----: | :------------------------------------: |
  | SIGCHILD |   17   | Informar ao pai sobre a morte do filho |

Algo interessante de se saber é que os sinais ***SIGKILL*** e ***SIGSTOP*** não podem ser tratados ou interrompidos, ou seja, suas ações padrões serão executadas de uma forma ou de outra.

Os sinais ***SIGUSR1*** e ***SIGUSR2*** são sinais que não possuem ação padrão. Isso possibilita a utilização desses sinais de forma mais livre pelo programador, de forma com que é possível atribuir funções ou tarefas específicas para um dos sinais (ou ambos). Por exemplo, uma aplicação pode utilizar o ***SIGUSR1*** para ativar os LOGs da aplicação, enquanto utiliza o ***SIGUSR2*** para parar os LOGs da aplicação. A questão maior é que é possível **utilizar esses sinais para transmitir mensagens específicas, diferentes daquelas apresentadas nas tabelas acima**.

Dentro do Linux podemos utilizar esses sinais através do programa `/bin/kill`. Apesar do nome, kill, o comando pode ser utilizado para enviar qualquer um dos sinais apresentados.

```bash
kill -SIGHUP 29778 # kill -1 29778
```

---

### Pipes

Como vimos, ao utilizarmos os sinais não é possível **enviar** dados entre processos. Sinais apenas avisam para o sistema operacional que determinada situação ou ação deve ser tomada.

Contudo, com os pipes temos a capacidade de **transmitir dados entre processos que estão relacionados entre si** (pai e filho). Apesar de conseguirmos realizar essa comunicação entre processos, existem alguns inconvenientes, que devemos nos atentar:

- As informações são trafegadas em **apenas uma direção**
  - O processo pai apenas envia, enquanto o processo filho apenas recebe
- As informações só podem ser transmitidas entre **processos relacionados** (pai e filho)

> Não é possível trafegar informações através de processos distintos e que não possuem um relacionamento, já que o *pipe* não fornece endereçamento para esses casos. O uso mais comum dos *pipes* está relacionado a comunicação de um processo pai e um processo filho, que são criados utilizando a **chamada de sistema** (*syscall*) `fork()`.




