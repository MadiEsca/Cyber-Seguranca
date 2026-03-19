# Desafio Bash Script – Auditoria Básica de Segurança

## 1. Introdução

Este desafio tem como objetivo consolidar os **fundamentos essenciais de Bash Script** por meio de um cenário prático inspirado em **cibersegurança defensiva**. Ele foi projetado para iniciantes que desejam sair do nível puramente mecânico de comandos e começar a **pensar como administradores e analistas de segurança**.

A proposta é desenvolver um script simples, porém realista, capaz de executar verificações básicas de segurança em um sistema Linux, simulando uma auditoria inicial.

---

## 2. Contexto do Desafio

Você foi encarregado de criar um script chamado:

```
auditoria_basica.sh
```

Esse script será utilizado por um administrador júnior para obter rapidamente informações relevantes sobre possíveis riscos básicos no sistema, diretamente via terminal.

O foco não está em exploração de vulnerabilidades, mas em **identificação de configurações sensíveis**, **boas práticas** e **leitura correta do sistema**.

---

## 3. Objetivo Geral

Desenvolver um script em Bash que:

* Utilize corretamente os principais fundamentos da linguagem
* Receba argumentos via linha de comando
* Execute verificações simples relacionadas à segurança do sistema
* Produza uma saída clara, objetiva e compreensível

---

## 4. Requisitos Funcionais

### 4.1 Validação de Argumentos

O script deve aceitar **exatamente um argumento**.

Argumentos válidos:

* `usuarios`
* `permissoes`
* `processos`

Comportamento esperado:

* Caso **nenhum argumento** seja passado → exibir mensagem de erro e encerrar
* Caso **mais de um argumento** seja passado → exibir mensagem de erro e encerrar
* Caso o argumento seja inválido → exibir mensagem de erro e encerrar

---

### 4.2 Estrutura de Decisão (`case`)

O script deve utilizar um `case statement` para definir o comportamento com base no argumento fornecido.

Cada modo representa um tipo de auditoria.

---

### 4.3 Modo `usuarios`

O script deve:

* Ler o arquivo `/etc/passwd`
* Listar os usuários existentes no sistema
* Identificar usuários com **UID 0**

Regras adicionais:

* Caso exista mais de um usuário com UID 0, exibir um **alerta de segurança**
* O usuário `root` deve ser considerado esperado

---

### 4.4 Modo `permissoes`

O script deve verificar os seguintes arquivos sensíveis:

* `/etc/passwd`
* `/etc/shadow`

O script deve:

* Exibir as permissões desses arquivos
* Verificar se `/etc/shadow` possui permissões inadequadas

Regra de alerta:

* Se `/etc/shadow` for legível por usuários que não sejam root, exibir um alerta de segurança

---

### 4.5 Modo `processos`

O script deve:

* Listar processos que estão sendo executados como `root`
* Contar quantos processos atendem a esse critério
* Exibir o total encontrado

---

## 5. Requisitos Técnicos (Fundamentos Obrigatórios)

O script **deve obrigatoriamente utilizar**:

* Variáveis
* Argumentos de linha de comando (`$#`, `$1`)
* Estruturas condicionais (`if`, `elif`, `else`)
* Estrutura de decisão (`case`)
* Estrutura de repetição (`for` ou `while`)
* Expansão de variáveis (`${variavel}`)
* Comandos básicos do sistema (`ls`, `cut`, `grep`, `awk`, `ps`)
* Códigos de saída (`exit`)

---

## 6. Restrições

* ❌ Não utilizar linguagens externas (Python, Perl, etc.)
* ❌ Não utilizar `sudo` dentro do script
* ❌ Não utilizar ferramentas avançadas de auditoria
* ✅ Utilizar apenas Bash e comandos padrão do sistema
* ✅ O script deve funcionar mesmo quando executado por um usuário comum (não root)

---

## 7. Saída Esperada

A saída do script deve:

* Ser clara e objetiva
* Evitar excesso de informações irrelevantes
* Utilizar mensagens diretas, semelhantes a um relatório simples

Exemplo de abordagem:

```
[INFO] Verificando usuários do sistema...
[ALERTA] Existe mais de um usuário com UID 0
```

---

## 8. Critérios de Avaliação

O desafio será considerado bem-sucedido se o script:

* Funcionar corretamente para todos os modos
* Tratar erros de forma adequada
* Utilizar corretamente os fundamentos do Bash
* Demonstrar compreensão básica de conceitos de segurança em sistemas Linux

---

## 9. Nível do Desafio

* **Nível:** Iniciante
* **Perfil esperado:** Estudantes de Bash Script e iniciantes em cibersegurança

Este desafio representa a base mínima necessária para evoluir para scripts mais complexos, como monitoramento de logs, automação de hardening e auditorias periódicas.

---

## 10. Observação Final

Antes de buscar ferramentas avançadas ou exploração de vulnerabilidades, é essencial dominar o básico. Grande parte das falhas de segurança reais ocorre por **configurações incorretas e falta de auditoria básica** — exatamente o que este desafio se propõe a abordar.
