# Forense computacional - Quarto módulo

## Ferramentas de forense digital

Write-Blockers: Hardware vs. Software (Revisão e Comparação) 

| Caractéristicas      | Hardware                                         | Software                                                     |
| -------------------- | ------------------------------------------------ | ------------------------------------------------------------ |
| Natureza             | Dispositivo físico externo                       | Aplicação ou driver de SO                                    |
| Nível de Operação    | Nível físico/controlador de disco                | Nível do sistema operacional                                 |
| Confiabilidade       | Alta (firmware dedicado, independente do SO)     | Menor (depende da integridade do SO, pode ser burlado)       |
| Custo                | Mais elevado                                     | Geralmente gratuito (modo somente leitura do SO)             |
| Uso Comum            | Aquisição forense padrão, em laboratório         | Análise de disco em sistemas operacionais "vivos", emergências |
| Recomendação Forense | Preferencial (maior garantia de não modificação) | Uso limitado, com riscos maiores                             |

## Ferramentas de Imagem de Disco (Aquisição) 

- **FTK Imager** (AccessData Imager): 
  - Tipo: Ferramenta comercial gratuita. 
  - Funções: Cria imagens forenses (E01, RAW, AD1), monta imagens, recupera arquivos deletados de forma limitada.
  - Interface: Gráfica, intuitiva. 
- **Guymager** (Linux): 
  - Tipo: Ferramenta open source.
  - Funções: Cria imagens forenses (E01, RAW) em ambiente Linux. 
  - Interface: Gráfica.dd (Disk Dump - Linux): 
  - Tipo: Ferramenta de linha de comando (open source).
  - Funções: Copia dados bit a bit de um dispositivo para outro. 
  - Vantagem: Universal, poderoso. 
  - Desvantagem: Requer conhecimento preciso da sintaxe, perigoso se usado incorretamente. 
- **EnCase Forensic** / **Magnet Acquire**: Ferramentas comerciais líderes para aquisição e análise.

## Suítes Forenses Digitais (Análise Abrangente) 

- EnCase Forensic (OpenText): 
  - Tipo: Comercial, uma das ferramentas mais antigas e abrangentes. 
  - Funções: Aquisição, análise de sistema de arquivos, recuperação de dados, análise de artefatos, criação de relatórios. 
  - Reconhecimento: Padrão da indústria, frequentemente usado em tribunais. 
- FTK (Forensic Toolkit - AccessData): 
  - Tipo: Comercial, similar ao EnCase em funcionalidade. 
  - Funções: Processamento de imagens, indexação, pesquisa, análise de e-mails, análise de artefatos. 
  - Vantagem: Integração com FTK Imager. 
- Autopsy (The Sleuth Kit): 
  - Tipo: Open Source, construída sobre o The Sleuth Kit.
  - Funções: Interface gráfica para análise de discos, recuperação de arquivos, análise de artefatos, timeline.
  - Vantagem: Gratuita, poderosa, extensível via módulos.

- I.P.E.D ([github](https://github.com/sepinf-inc/IPED))
  - Pesquisar mais sobre a ferramenta

## Ferramentas de Memória Forense (RAM) 

- Volatility Framework: 
  - Tipo: Open Source, uma das ferramentas mais completas para análise de dump de RAM. 
  - Funções: Extrai processos, conexões de rede, chaves de registro, senhas, código de malware da memória. 
  - Plataformas: Windows, Linux, macOS. 
  - Interface: Linha de comando. 
- LiME (Linux Memory Extractor): 
  - Tipo: Open Source. 
  - Funções: Ferramenta para criar dumps de RAM de sistemas Linux. 
  - Vantagem: Pode ser carregada como módulo de kernel, minimizando a contaminação. 
- WinPMEM / LinPMEM / MacPMEM (Google): 
  - Tipo: Open Source. 
  - Funções: Ferramentas de aquisição de RAM para diferentes sistemas operacionais. 
  - Vantagem: Simples e eficaz.

## Ferramentas de Rede Forense (Network Forensics) 

- Wireshark: 
  - Tipo: Open Source, analista de protocolo de rede gráfico. 
  - Funções: Captura e análise detalhada de pacotes de rede.
  - Vantagem: Filtros poderosos, reconstrução de sessões, análise de protocolos.
- tcpdump: 
  - Tipo: Open Source, ferramenta de linha de comando para captura de pacotes. 
  - Funções: Captura pacotes brutos, ideal para automação e servidores remotos. • 
- Zeek (Bro): 
  - Tipo: Open Source, IDS/IPS e sistema de monitoramento de segurança de rede. 
  - Funções: Geração de logs detalhados de rede, detecção de intrusão, análise de protocolo. 
  - Vantagem: Foco em metadados de conexão, scripts personalizados. 
- Suricata: 
  - Tipo: Open Source, IDS/IPS/NSM (Network Security Monitoring). 
  - Funções: Detecção de intrusão (baseada em regras), análise de tráfego.

## Ferramentas de Análise de Logs Centralizadas 

- ELK Stack (Elasticsearch, Logstash, Kibana): 
  - Tipo: Open Source, suite completa para ingestão, armazenamento, busca e visualização de logs.
  - Elasticsearch: Banco de dados distribuído para busca de logs. 
  - Logstash: Pipeline de ingestão para coletar, transformar e enriquecer logs. 
  - Kibana: Interface gráfica para visualização, dashboards e relatórios. 
- Splunk: 
  - Tipo: Comercial, líder de mercado em SIEM (Security Information and Event Management). 
  - Funções: Ingestão de logs, monitoramento em tempo real, detecção de ameaças, correlação de eventos, relatórios forenses. 
  - Vantagem: Poderoso, escalável, rico em funcionalidades. o Desvantagem: Alto custo. 
- Graylog: 
  - Tipo: Open Source (com versão Enterprise). 
  - Funções: Gerenciamento centralizado de logs, análise, alertas.

## Ferramentas de Forense Móvel 

- Cellebrite UFED (Universal Forensic Extraction Device):
  - Tipo: Comercial, líder de mercado. 
  - Funções: Extração lógica e física de dados de milhares de modelos de celulares. 
  - Avançado: Desbloqueio de dispositivos, bypass de criptografia. 
- XRY (MSAB): 
  - Tipo: Comercial, concorrente do Cellebrite. 
  - Funções: Extração e análise de dados de dispositivos móveis. 
- Oxygen Forensics Detective: 
  - Tipo: Comercial. 
  - Funções: Análise de dados de celulares, tablets, drones e dispositivos de IoT. 

- Magnet AXIOM: 
  - Tipo: Comercial, suite forense que inclui análise de mobile. 
  - Funções: Análise de artefatos de dispositivos móveis e computadores.
- Ferramentas Open Source: 
  - Vantagens: Gratuito, código aberto (transparência), flexibilidade, comunidade ativa, inovação.
  - Desvantagens: Sem suporte formal, curva de aprendizado, exige maior conhecimento técnico.
  - Exemplos: Autopsy/TSK, Volatility, Wireshark, dd, Guymager, ELK Stack.
- Ferramentas Comerciais: 
  - Vantagens: Suporte técnico, interfaces amigáveis, automação, certificação, aceitação legal. 
  - Desvantagens: Alto custo, código fechado (black box), menos flexibilidade. 
  - Exemplos: EnCase, FTK, Cellebrite, XRY, Splunk.Melhor 
- **Prática: Combinar o uso de ambas para aproveitar os benefícios de cada uma.**

## Virtualização e Contêineres em Forense Digital

- Uso: Criar ambientes isolados e controlados para análise de malware, engenharia reversa e testes.
- Máquinas Virtuais (VMs): 
  - Vantagens: Isolamento completo do sistema host, fácil criação de snapshots (pontos de restauração).
  - Uso: Análise de malware com segurança, testes de ferramentas. 
- Contêineres (Docker): 
  - Vantagens: Leves, rápidos para iniciar e descartar, ideal para ferramentas forenses. 
  - Uso: Empacotar e executar ferramentas forenses em ambientes consistentes. 
- Benefício: Proteção da estação de trabalho forense contra códigos maliciosos e garantia de um ambiente de análise limpo.

## Hardware Forense Especializado

- Uso: Criar ambientes isolados e controlados para análise de malware, engenharia reversa e testes.
- Máquinas Virtuais (VMs): oVantagens: Isolamento completo do sistema host, fácil criação de snapshots (pontos de restauração).
  - Uso: Análise de malware com segurança, testes de ferramentas. 
- Contêineres (Docker): 
  - Vantagens: Leves, rápidos para iniciar e descartar, ideal para ferramentas forenses. 
  - Uso: Empacotar e executar ferramentas forenses em ambientes consistentes. 
- Benefício: Proteção da estação de trabalho forense contra códigos maliciosos e garantia de um ambiente de análise limpo.

----

Recomendações de linux

- Caine
- Deft
- Kali