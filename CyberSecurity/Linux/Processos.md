# Processos

Vamos entender o que são os processos dentro do sistema operacional.

----

- Nos sistemas operacionais, podemos definir um processo como sendo, basicamente, um programa em execução.
  - Aplicativos
  - Comandos
- Cada processo tem seu endereço de memória próprio, o que implica que processos distintos não se comunicam. Isso pode ser mitigado com a utilização do métodos *IPC* (*inter-process communication*), tais como **sinais**, **pipes**, **named pipes**, **sockets**, **memória compartilhada** etc...

---

## composição de um processo

O sistema operacional necessita de formas para gerenciar e controlar os processos que estão em execução ou não. Para isso, os processos contam com um conjunto de informações, dentre as quias se encontram:

- Proprietário do processo;
- Estado do processo (em espera, em execução, etc);
- Prioridade de execução;
- Recursos de memória.

Além das informações acima, os processos dispõe de outras características para que o sistema operacional possa gerenciá-los de uma maneira mais eficiente. Um dos meios para que isso ocorra é atribuir a cada processo um ***PID*** (*process identifier*).

### PID & PPID

Sempre que um processo é criado, é atribuído a ele um **Identificador Único**, ou seja, não existe um ***PID*** para um grupo de processos ou para dois processos diferentes.

Os sistemas baseados em Unix precisam que um **processo já existente se duplique** para que **a cópia possa ser atribuída a uma tarefa nova**. Quando isso ocorre, o processo "copiado" recebe o nome de "processo pai", enquanto que o novo é denominado "processo filho". É nesse ponto que o PPID (**P**arent **P**rocess **Id**entifier) passa a ser usado: o ***PPID*** de um processo nada mais é do que o ***PID*** de seu processo pai.
