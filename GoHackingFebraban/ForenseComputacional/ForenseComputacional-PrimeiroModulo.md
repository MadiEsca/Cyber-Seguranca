# Forense computacional - Primeiro módulo

Consiste em uma introdução a respeito do que é a forense computacional, introduzindo conceitos fundamentais.

## O que é

- Definição: A ciência de recuperar e investigar materiais encontrados em dispositivos digitais.
- Objetivo Principal: Identificar, preservar, coletar, analisar e apresentar evidências digitais de forma legalmente aceitável.
- Campo de Atuação: Incidentes cibernéticos, crimes digitais, litígios civis, investigações corporativas.
- Importância: Essencial para a justiça criminal, segurança corporativa e defesa nacional.
- Pilares: Integridade, autenticidade, confiabilidade e admissibilidade da evidência.

----

## Objetivos de uma Investigação Digital 

- Identificar o Ocorrido: O que aconteceu, quando, como, onde e por quem (se possível).
- Preservar Evidências: Proteger a integridade e autenticidade dos dados digitais.
- Recuperar Dados: Restaurar informações deletadas, ocultas ou corrompidas.
- Analisar Evidências: Interpretar os dados para reconstruir eventos e extrair informações relevantes.
- Documentar e Relatar: Registrar o processo e as descobertas de forma clara e compreensível.
- Apoiar Processos Legais/Internos: Fornecer base para ações judiciais, políticas de segurança ou resposta a incidentes.

----

## As Fases da Investigação Digital (Modelo Geral) 

Os passos a seguir são essenciais para a proteção da nossa **cadeia de custódia**, que se refere ao **registro metódico, cronológico e detalhado** sobre a busca, apreensão, manuseio e controle de vestígios coletados em investigações. 

- Preparação: Desenvolvimento de kits forenses, planos de resposta a incidentes, treinamento.
  - Explicação: *É uma etapa preventiva que garante com que a equipe esteja preparada antes de terem que agir prontamente*.
- Identificação: Reconhecimento do incidente e dos sistemas envolvidos.
  - Explicação: É onde reconhecemos a presença de um problema
- Preservação: Isolamento e proteção das fontes de evidências. 
  - Explicação: *Uma das fases mais criticas para a garantia de uma evidência*.
- Coleta (Aquisição): Criação de cópias forenses íntegras das evidências.
  - Explicação: *Uma das fases mais criticas para a garantia de uma evidência*.
- Análise: Exame sistemático das evidências para extrair informações relevantes.
  - Onde o detetive trabalha
- Documentação: Registro detalhado de todas as ações e descobertas.
  - Explicação: uma das etapas onde é criado um artefato compreensível para que o destinatário possa ler e compreender o que foi feito
- Relato (Reporting): Elaboração de um relatório compreensível para stakeholders.
  - Explicação: uma das etapas onde é criado um artefato compreensível para que o destinatário possa ler e compreender o que foi feito
- Apresentação (Testemunho): Se necessário, explicação das descobertas em juízo

---

## Considerações Legais e Éticas

- **Legalidade**: Necessidade de autorização (mandados judiciais, políticas internas) para acesso a dados.
- **Jurisdição**: Leis variam entre países e estados.
- **Privacidade**: Respeito à legislação de proteção de dados (LGPD, GDPR).
- Ética Profissional: Imparcialidade, objetividade, confidencialidade, competência.
- Consequências: Investigação ilegal ou antiética pode anular evidências e resultar em sanções

---

## Tipos de Evidências Digitais

> Importante!
>
> esses tipos de evidencias influenciam diretamente na metodologia de aquisição e preservação de informações
>
> Os tipos abaixo estão organizados em ordem de prioridade de coleta, seguindo a premissa do "mais volátil ao menos volátil"

Entender quais são e como funcionam esses tipos de evidencias, é primordial para a **aquisição**, **preservação** e **análise** das informações e dados coletados, levando a conta o **"valor"** e a **"volatilidade"** dos dados.

- **Evidências Voláteis**: Dados que *se perdem ao desligar o sistema* (ex: RAM, registros de CPU, conexões de rede ativas). 
  - Devem ser as primeiras evidências a serem coletadas
  - Podem ser perdidas assim que o computador/servidor é desligado
- **Evidências Persistentes**: Dados *armazenados em mídias não voláteis* (ex: discos rígidos, SSDs, pendrives, cartões de memória).
  - Podem ser sobrescritas
- **Evidências Latentes**: Dados que *não são imediatamente visíveis ou acessíveis*, mas *podem ser recuperados* (ex: arquivos deletados, metadados, slack space).
  - Podem passar despercebidas
- **Evidências de Rede**: *Logs de firewall, registros de tráfego, capturas de pacotes*.
  - Um dos principais vetores de ataque da atualidade
- **Evidências em Nuvem**: *Dados armazenados em serviços de nuvem* (IaaS, PaaS, SaaS).

---

## O Princípio de Locard na Era Digital

Um dos fundamentos da ciência forense

- Princípio Original (Edmond Locard): "Todo contato deixa um rastro." (When two objects come into contact, a transfer of material occurs.)
- Contexto Digital: Toda interação com um sistema digital deixa um rastro ou modifica o ambiente.
- Transferência Digital: Acesso a um arquivo, modificação de um registro, navegação web, execução de programas. •Vestígios: Logs, metadados, arquivos temporários, entradas de registro, históricos.
- Aplicação na Forense: Busca por esses "rastros digitais" para reconstruir eventos e identificar ações.

---

## Desafios na Forense Digital 

- **Volatilidade**: Dados efêmeros que podem ser perdidos rapidamente.
  - Posts em redes sociais
- **Volume de Dados**: Lidar com terabytes de informação. 
- **Criptografia**: Dificuldade em acessar dados protegidos.
- **Anti-forense**: Técnicas para ocultar, destruir ou confundir evidências.
- **Jurisdição e Fronteiras**: Incidentes que atravessam múltiplas geografias e leis.
- **Tecnologias em Evolução**: Constante necessidade de atualização de ferramentas e conhecimentos.
- **Fragmentação**: Evidências espalhadas por múltiplos sistemas e locais (nuvem, dispositivos móveis).

---

## Forense Digital vs. Resposta a Incidentes (IR) 

- Resposta a Incidentes (IR):
  - **Foco: Conter, erradicar e recuperar rapidamente de um incidente.**
  - Prioridade: Restaurar a operação normal do negócio. 
  - Tempo: Ações rápidas, em tempo real ou quase. 
  - Exemplo: Bloquear um ataque, restaurar backups. 
- Forense Digital:
  - **Foco: Investigar a fundo o que aconteceu, como e por quem, para fins legais ou de aprimoramento de segurança.** 
  - Prioridade: Preservar a integridade da evidência. 
  - Tempo: Processo metódico, pode ser mais demorado. 
  - Exemplo: Reconstruir a timeline do ataque, identificar a origem.
- Interligação: IR pode gerar a necessidade de FC; FC fornece informações para IR

---

## Papéis e Responsabilidades do Investigador Digital

- **Conhecimento Multidisciplinar**: TI, Direito, Criminologia, Psicologia (para engenharia social).
- **Competências Técnicas**: Sistemas operacionais, redes, segurança, formatos de arquivo, análise de malware.
- **Competências Metodológicas**: Raciocínio lógico, atenção aos detalhes, organização, documentação.
- **Competências Comportamentais**: Integridade, ética, imparcialidade, comunicação.
  - É o principal dentre tudo que foi citado acima
- Certificações: GCFE, GCFA, CCE, EnCE, ACE.

---

## Tipos de Investigações Forenses Digitais

- **Criminosa**: Crimes digitais (fraude, extorsão, pedofilia, terrorismo, invasão). Evidências para processos criminais. 
- **Civil**: Litígios entre partes (disputas de propriedade intelectual, divórcios, quebra de contratos). 
- **Administrativa/Corporativa**: Violação de políticas internas, assédio, espionagem industrial, vazamento de informações. 
- **Regulatória**: Conformidade com leis e regulamentos (LGPD, normas setoriais).
- **Militar/Inteligência**: Ciberguerra, espionagem, proteção de infraestrutura crítica.

---

## Técnicas de Ocultação de Dados (Anti-forense)

- **Criptografia**: Proteger o conteúdo de arquivos ou discos inteiros com senhas/chaves.
  - Atualmente o melhor método para proteção de arquivos, já que "bagunçam" as informações e só "organizam" quando uma chave de acesso é fornecida ou quando o método de criptografia é igualmente conhecido
- ***Esteganografia**: Ocultar dados dentro de outros arquivos (imagens, áudios) de forma imperceptível.*
- **Exclusão Segura/Limpeza de Disco**: Sobrescrever dados múltiplas vezes para dificultar a recuperação. 
- **Ofuscação/Renomeação**: Alterar nomes de arquivos/pastas, tipos de arquivo para disfarçar.
- **Uso de Máquinas Virtuais/Containers**: Isolar atividades em ambientes descartáveis.
- ***Anti-Forense para Segurança Pública**: Conhecer essas técnicas é fundamental para combatê-las.*

---

## Importância da Forense Computacional na Segurança Pública

- **Combate ao Crime Cibernético**: Investigação de fraudes, ataques, extorsões, crimes contra menores.
- **Inteligência Policial**: Análise de dados digitais para prevenção e elucidação de crimes.
- **Provas Judiciais**: Geração de evidências robustas para processos criminais.
- **Segurança Nacional**: Investigação de ciberataques contra infraestruturas críticas, espionagem.
- **Desenvolvimento de Políticas**: Informações forenses que ajudam a criar leis e políticas de segurança mais eficazes. 
- **Proteção à Sociedade**: Identificação e responsabilização de criminosos digitais.

---

