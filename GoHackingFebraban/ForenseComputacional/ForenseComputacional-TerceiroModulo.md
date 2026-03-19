# Forense Computacional - Terceiro Módulo

## Coleta e análise de Logs e Dispositivos

- **Logs**: Registros gerados por sistemas operacionais, aplicações e dispositivos de rede. 
- **Conteúdo**:
  - Eventos do sistema
  - ações do usuário
  - erros
  - tentativas de acesso
  - atividades de segurança. 
- **Importância**: Base para reconstruir eventos, identificar atividades suspeitas e determinar a causa raiz.
- **Desafio**: 
  - Volume
  - heterogeneidade de formatos
    - Diversidade de formatos de logs
  - tempo de retenção

## Fontes de Logs Comuns

- Sistemas Operacionais (SO):
  - Windows: Event Logs (Segurança, Sistema, Aplicação), logs do PowerShell, logs de Firewall. 
  - Linux: Syslog, logs de autenticação (auth.log), logs de kernel (kern.log), logs de aplicações (Apache, Nginx).
- Aplicações: 
  - Servidores Web (Apache, Nginx, IIS): Acessos, erros, requisições. 
  - Bancos de Dados (SQL Server, MySQL, PostgreSQL): Acessos, alterações, erros. 
  - Aplicações Legadas/Customizadas: Logs específicos da aplicação. 
- Dispositivos de Rede: Firewalls, IDS/IPS, roteadores, switches, balanceadores de carga. 
- Serviços em Nuvem: CloudTrail (AWS), Stackdriver (Google Cloud), Azure Monitor (Azure).

## Coleta de Logs: Estratégias e Ferramentas 

- Coleta Local (Manual): Acessar diretamente o dispositivo e copiar os arquivos de log.
  - Vantagem: Dados brutos originais. 
  - Desvantagem: Lenta, escala mal, altera a evidência (se o SO está ligado). 
- Coleta Remota (Agent-based): Agentes instalados nos dispositivos enviam logs para um servidor central. 
  - Vantagem: Automatizada, escalável, menos intrusiva. 
  - Desvantagem: Depende da instalação e configuração do agente. 
- Centralização de Logs (SIEM/ELK): Sistemas que agregam, armazenam e analisam logs de múltiplas fontes. 
  - Vantagem: Visão unificada, correlação de eventos, alertas. 
  - Desvantagem: Complexidade de implantação, custo. 
- Ferramentas: 
  - Syslog-ng
  - rsyslog (Linux)
  - Winlogbeat
  - nxlog (Windows)
  - Splunk
  - ELK Stack (Elasticsearch, Logstash, Kibana).

## Análise de Logs: Técnicas e Insights

1. **Filtragem**: Reduzir o volume de logs para eventos relevantes (por data/hora, IP, usuário).
2. **Correlação de Eventos**: Relacionar eventos de diferentes fontes para reconstruir uma sequência de ataque. 
3. **Detecção de Anomalias**: Identificar padrões incomuns que podem indicar atividades maliciosas.
4. **Pesquisa de Palavras-Chave**: Buscar termos específicos (malware, erros, logins falhos). 
5. **Análise de Tendências**: Observar o comportamento ao longo do tempo. 
6. **Timeline Analysis**: Criar uma linha do tempo detalhada dos eventos.

## Análise Forense de Discos Rígidos: Fundamentos 

- **Objetivo**: Extrair e interpretar informações de mídias de armazenamento persistente.
- **Conteúdo Analisado**: oSistema de Arquivos (FAT, NTFS, ext4, HFS+). 
  - **Arquivos e Pastas** (visíveis, ocultos, protegidos).
  - **Arquivos Deletados** e Dados Residuais.
  - **Metadados de Arquivos** (timestamps, autor, software). 
  - **Registros do Sistema Operacional** (Registry no Windows). 
  - **Artefatos de Internet** (histórico de navegador, cache, cookies). 
- Fase: Geralmente realizada após a aquisição da imagem forense.

## Sistemas de Arquivos: A Organização dos Dados 

- Função: Estrutura lógica que o sistema operacional usa para organizar e gerenciar arquivos e diretórios em uma mídia. 
- Informações fundamentais: 
  - Tabela de Alocação de Arquivos: Onde os arquivos estão fisicamente no disco.
  - Metadata: Atributos de arquivos (nome, tamanho, datas de criação/modificação/acesso). 
  - Estrutura de Diretórios: Hierarquia de pastas. 
- Tipos Comuns e Suas Peculiaridades: 
  - FAT (File Allocation Table): Mais antigo, simples, menos robusto.
  - NTFS (New Technology File System - Windows): Robusto, segurança, journaling, compressão, criptografia.
  - ext4 (Linux): Comum em Linux, journaling, grande volume. 
  - HFS+ / APFS (macOS): Específicos da Apple.
- Importância Forense: O conhecimento do sistema de arquivos é essencial para recuperar dados e entender como o SO interage com o disco.

## Recuperação de Arquivos Deletados e Espaços Residuais 

- **Princípio**: Quando um arquivo é "deletado", seus dados raramente são apagados imediatamente.
- **Áreas de Interesse**: 
  - **Espaço Não Alocado** (Unallocated Space): Áreas do disco que o sistema de arquivos considera vazias. Podem conter dados de arquivos deletados. 
  - **Slack Space**: Espaço não utilizado no último cluster alocado para um arquivo. Pode conter resíduos de dados anteriores. 
  - MFT (NTFS) / Inodes (ext4): Registros que armazenam metadados de arquivos, mesmo após a exclusão lógica. 
- Técnicas: 
  - File Carving (busca por cabeçalhos/rodapés de arquivos)
  - análise de tabelas de alocação.
- Ferramentas: 
  - PhotoRec
  - Foremost
  - EnCase
  - FTK.

## Análise do Registro do Windows (Registry Forensics) 

- **Registro** (Registry): Banco de dados hierárquico que armazena configurações de baixo nível para o sistema operacional Windows, hardware, software e perfis de usuário.
- **Informações Chave**: 
  - Programas instalados e executados recentemente (MRU - Most Recently Used). 
  - Dispositivos USB conectados (Plug and Play - PnP). 
  - Contas de usuário, senhas (hashing). 
  - Configurações de rede, firewalls. 
  - Histórico de pesquisa, documentos recentes. 
  - Horários de boot e shutdown do sistema. 
- Ferramentas: Registry Explorer, RegRipper, Autoruns. 
- **Importância: Tesouro de artefatos para a reconstrução de atividades do usuário e do sistema.**

## Forense de Navegadores Web 

- **Objetivo**: Analisar os artefatos deixados por navegadores web para reconstruir a atividade online do usuário. 
- **Artefatos Comuns**: 
  - **Histórico de Navegação**: URLs visitadas, timestamps. 
  - **Cache**: Cópias locais de páginas web, imagens, scripts. 
  - **Cookies**: Pequenos arquivos que armazenam informações de sessão, preferências, rastreamento. 
  - **Downloads**: Lista de arquivos baixados. 
  - **Bookmarks/Favoritos**: Sites salvos pelo usuário. 
  - **Autocompletar**: Dados preenchidos automaticamente em formulários.
- Navegadores: Chrome, Firefox, Edge, Safari, Opera (cada um com formatos de armazenamento diferentes).

## Forense de E-mails 

- **Objetivo**: Investigar comunicações por e-mail para encontrar provas de fraude, assédio, espionagem, vazamento de dados. 
- **Fontes de E-mails**: 
  - Cliente de E-mail Local: Outlook (PST/OST), Thunderbird (MBOX). 
  - Servidor de E-mail (Webmail/Corporativo): Caixa de entrada/saída em servidores (requer acesso legal). 
  - Logs de Servidor de E-mail: Registros de envio, recebimento, tentativas de login. 
- **Análise de Cabeçalhos**: 
  - Remetente/Destinatário: Real, não apenas o que aparece na interface. 
  - Rotas: Servidores pelos quais o e-mail passou. 
  - Timestamps: Horários precisos de envio/recebimento. 
  - IPs de Origem: Endereço IP do remetente original. 
  - Conteúdo: Corpo da mensagem, anexos.

## Ferramentas de Forense Digital: Visão Geral 

- Categorias: Aquisição: Criar cópias forenses (hardware write-blockers, FTK Imager). 
- Análise: Examinar e extrair dados da imagem forense (EnCase, Autopsy, Volatility). 
- Recuperação: Restaurar dados deletados (PhotoRec, Foremost). 
- Visualização/Relato: Apresentar as descobertas (EnCase, FTK, Ferramentas de timeline). 
- Tipos: 
  - Open Source: Acessíveis, flexíveis, comunidade ativa. 
  - Comerciais: Robustas, certificadas, suporte especializado.
- Importância: A escolha da ferramenta certa é fundamental para a eficiência e validade da investigação.