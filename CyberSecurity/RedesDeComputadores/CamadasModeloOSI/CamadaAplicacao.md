# Camada de Aplicação

## Introdução

Essa é a camada mais próxima do usuário final, além de ser a última camada (7) dentro do modelo OSI.

A camada de aplicação é responsável por **estabelecer a comunicação** e **disponibilizar os recursos necessários** para que uma comunicação entre *processos/aplicações/serviços* possa ocorrer **por meio da rede**, através de protocolos específicos. Essa camada **não trabalha com o transporte dos dados**, mas sim com sua **apresentação** para o usuário final/software que necessita de que os dados solicitados, ou requisitados, sejam apresentados da forma correta.

E para que tal comunicação seja estabelecida e que recursos sejam devidamente  disponibilizados, a estrutura de *client-server* é adotada. Em redes P2P, onde não existe um servidor central, essa estrutura não interfere em nada, já que ambos os *hosts* atuam tanto como *cliente* quanto como *servidor*.

---

## Conceitos chave

- Estabelece a **comunicação** e disponibiliza **recursos** necessários para que os dados requisitados possam ser apresentados da devida forma para o solicitante.
- **Não** trabalha com o transporte dos dados.
- **Processos são serviços em execução**, ou seja, a comunicação entre **serviços em execução** é, exatamente, a mesma coisa que uma comunicação entre **processos**.

## Funções

- **Identificação e autenticação de partes comunicantes** — verificar se o serviço do outro lado é quem diz ser antes de trocar os dados.
- **Determinação de disponibilidade de recursos** — verificar se o serviço remoto está acessível e pronto para comunicação.
- **Sincronização de comunicação** — estabelecer e controlar o diálogo entre aplicações.
- **Definição do formato e semântica dos dados de aplicação** — como os dados serão interpretados pela aplicação receptora.

## Protocolos e serviços envolvidos

| Protocolo      | Porta(s)       | Relevância para Cibersegurança              |
| -------------- | -------------- | ------------------------------------------- |
| HTTP/HTTPS     | 80 / 443       | OWASP, proxying, inspeção SSL no pfSense    |
| DNS            | 53 (UDP/TCP)   | Vetor de ataque, DNS tunneling, exfiltração |
| SMTP/IMAP/POP3 | 25 / 143 / 110 | Phishing, análise forense de email          |
| FTP/SFTP       | 21 / 22        | Transferência insegura, configuração        |
| SSH            | 22             | Hardening, autenticação por chave           |
| LDAP/LDAPS     | 389 / 636      | Active Directory, enumeração                |
| Kerberos       | 88             | Autenticação AD, Pass-the-Ticket            |
| SNMP           | 161 (UDP)      | Monitoramento, coleta de informações        |
| RDP            | 3389           | Acesso remoto, vetor de ataque              |

---

## Tópicos para pesquisa

- Redes P2P (Peer-to-Peer)