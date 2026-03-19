# DevSecOps

> Conceitos importantes!
>
> Antigamente, nos primórdios do DevOps, a segurança era a **última parte** a ser feita dentro do ciclo de desenvolvimento de uma aplicação e com isso, deixava muito a desejar.

- Aumento de ataques cibernéticos direcionados a Softwares
- Ciclos de desenvolvimento cada vez mais rápidos com DevOps -> Risco de "pular segurança"
- DevSecOps garante **agilidade com segurança**
- Segurança passa a ser parte natural do processo, não um bloqueio!

![image-20251202085614420](/home/botat/.config/Typora/typora-user-images/image-20251202085614420.png)

---

## Controles DevSecOps

![image-20251201214922351](/home/botat/.config/Typora/typora-user-images/image-20251201214922351.png)

---

## Shift Security Left

É quando a segurança é "*puxada para a esquerda*"

Ou seja, ao invés da segurança ser aplicada somente na etapa final, como mencionada anteriormente, ela é "_puxada_" cada vez mais da direita para a esquerda, o que pode resultar em, decorrência das atualizações da aplicação e da burocracia que é adquirir algumas ferramentas de segurança, a atualização ou substituição de algumas ferramentas antes mesmo de serem utilizadas.

A segurança começa na fase de planejamento. Ameaças e riscos são avaliados desde o design da aplicação. Segurança inserida em cada etapa: 

- Planejamento
- Desenvolvimento
- Testes 
- Build e deploy 
- Operações e monitoramento 

É o padrão utilizado pelo mercado atual, mas o ideal, principalmente no início do desenvolvimento de uma aplicação, é o _Start Secutiry Left_, que leva em consideração a segurança desde os princípios do desenvolvimento e vai acrescentando outros passos de segurança com o decorrer do desenvolvimento da aplicação.

- *Shifting Security Left* – Traduzindo seria algo como trazer a segurança para a esquerda
- Nos permite lidar com problemas de segurança com antecedência e com frequência 
- Se deixarmos as práticas de segurança para o fim, acabaremos com defeitos de segurança na produção. 
- Portanto, *Shifting Security Left* reduz o risco e os custos de corrigir problemas de segurança 
- Como vimos anteriormente, encontrar e corrigir bugs de segurança mais cedo leva a menos erros e menos comprometimentos

![image-20251201221539207](/home/botat/.config/Typora/typora-user-images/image-20251201221539207.png)

- Dividir pra conquistar - quebrar os ciclos de implantação e verificação de segurança em pequenos passos.
- Teste cedo, teste sempre - A cada nova modificação (Pull Requests) dentro do projeto, testes, mesmo que menores, são realizados afim de verificar a segurança da aplicação antes dela ir pra produção e consequentemente terem que ser tratadas futuramente.

---

## Automação de Testes de Segurança

*Por que automatizar?*

- Para acompanhar a velocidade dos times DevOps
  - As pessoas estão gerando códigos cada vez mais rápido, principalmente com o auxílio das I.As.
- Reduz erros humanos e garante verificações consistente
  - Criar automações para verificar erros que podem ocorrer dentro do código de uma aplicação.

Principais testes automatizados: 

- **SAST** (*Static* Application Security Testing): *analisa o código-fonte*
- **SCA** (Software Composition Analysis): verifica vulnerabilidades em *bibliotecas* e *dependências* 
- **DAST** (*Dynamic* Application Security Testing): *testa a aplicação em execução*
- **IAST** (*Interactive* Application Security Testing): combina análise estática e dinâmica
  - Está caindo em desuso, já que boa parte das empresas não estão mais utilizando
- **Scanning** de *contêineres e imagens para vulnerabilidades*
- ***Secret* Scanning**: É uma análise estática feita dentro do código em busca de *secrets*, são **chaves**, **senhas**, **chaves SSH**, **tokens**, (variáveis de ambiente) entre outras informações sensívei

**O objetivo é prevenir, não apenas corrigir no final**

---

## Controles de segurança em pipelines (CI/CD)

Objetivo: Garantir que somente código seguro chegue na produção 

- Pipelines realizam verificações de segurança automaticamente
- Gates e políticas de segurança podem bloquear builds vulneráveis
- Controles comuns no CI/CD: 
  - Validação de secrets (credenciais)
  - Scanning de infraestrutura como código (IaC)
  - Testes de segurança automatizados (SAST/SCA/DAST)
  - Assinatura e verificação de artefatos e imagens
  - Controle de permissões e segregação de funções 

**Segurança contínua: cada commit é analisado**

---

## Ferramentas de DevSecOps

### SAST:

- CodeQL, SonarQube, Checkmarx, Semgrep 

### SCA:

- Dependabot, Snyk, OWASP Dependency-Check, Black Duck 

### DAST:

- ZAP, Burp Suite, StackHawk, Caido

---

## Boas Práticas

- “Shift-left” + “Shift-right”: testar antes e monitorar depois 
- Cultura de segurança compartilhada entre times
- Treinamentos contínuos para desenvolvedores
- Uso mínimo de privilégios e boas práticas de identidade 
- Gestão de secrets com cofre seguro (ex.: Vault, AWS Secrets Manager)
- Monitoramento e resposta a incidentes integrados
- Adoção de frameworks como OWASP SAMM e NIST SSDF

---

## Benefícios do DevSecOps

- Redução de riscos e vulnerabilidades
- Menor custo para corrigir falhas
- *Releases* mais rápidas e seguras
- Maior colaboração entre equipes
- Conformidade com requisitos regulatórios
- Mais confiança do cliente e da organização