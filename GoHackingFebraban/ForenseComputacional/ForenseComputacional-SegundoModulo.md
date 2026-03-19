# Forense computacional - Segundo módulo

## Preservação de Evidências: O Imperativo da Integridade 

- **Definição**: Proteger a evidência digital contra qualquer alteração, destruição ou corrupção.
- **Objetivo Primordial**: Manter a autenticidade e a integridade da evidência desde a coleta até a apresentação.
- **Princípio Básico**: "*Não modifique o original*." Trabalhe sempre com cópias.
- **Consequência de Falha**: Evidência pode ser invalidada e não ser aceita em juízo.

---

## Integridade da Evidência: Hashing Criptográfico

- **Hashing**: Função matemática que gera uma "_assinatura digital_" única para um dado.
- Propriedades: 
  - Determinístico: Mesma entrada sempre gera a mesma saída. 
  - Único (quase): Pequena alteração na entrada gera uma saída completamente diferente.
  - Não Inversível: Não é possível reconstruir a entrada a partir do hash.
- Algoritmos Comuns: 
  - MD5 (obsoleto para segurança)
  - SHA1 (desaconselhado)
  - SHA256 (comumente usado)
  - SHA512.

- Uso na Forense: Calcular o hash da evidência original **ANTES** e **DEPOIS** da aquisição, e da cópia adquirida.
  - Garantindo que o arquivo original permaneceu inalterado


---

## Cadeia de Custódia: Definição e Propósito

- **Definição**: Registro cronológico e documentado de todas as pessoas que tiveram posse da evidência, da coleta à apresentação.
- **Propósito**: Provar que a evidência não foi alterada, contaminada ou substituída.
- **Fundamento Legal**: Garante a admissibilidade da evidência em juízo.
- **Elementos Chave**: *Quem*, *o quê*, *quando*, *onde*, *por que* e *como* cada evidência foi tratada.

---

## Elementos Essenciais da Cadeia de Custódia

- **Identificação da Evidência**: Número de identificação único, descrição detalhada do item.
- **Local e Data/Hora da Coleta**: Precisão de onde e quando a evidência foi encontrada.
- **Pessoa que Coletou**: Nome, assinatura, função.
- **Local de Armazenamento**: Onde a evidência foi guardada após a coleta.
- **Transferências de Posse**: Registro de quem recebeu a evidência de quem, quando e por que.
- **Ações Realizadas**: Cada acesso, análise, cópia ou extração, com data/hora e nome do responsável.
- **Hashing da Evidência**: Registros do hash do original e da cópia forense.

---

## Dispositivos Write-Blockers: Protegendo o Original

- **Função**: Impedir que qualquer dado seja escrito ou modificado no dispositivo de evidência original.
- **Operação**: Atuam como uma "barreira de hardware" ou "software" entre o dispositivo original e o sistema do perito.
- Tipos:
  - **Hardware Write-Blockers**: Dispositivos físicos (portas USB, SATA, IDE) com firmware dedicado. Preferidos pela segurança e confiabilidade. 
  - **Software Write-Blockers**: Soluções baseadas em software (ex: modo somente leitura de SO, ferramentas de linha de comando). Menos robustos, mas úteis em algumas situações.
- **Importância**: Garantem a não contaminação da evidência original durante a aquisição.

---

## Métodos de Aquisição de Evidências: Dead vs Live

Geralmente "dead" e "live" podem ser encontrados com outros nomes, como "cold" e "hot" ou algum outro que represente uma antagonização, dessa forma, representando sempre algo **estático** e algo dinâmico.

- Aquisição Dead (Forensic Acquisition): 
  - Método: Desligar o dispositivo e **adquirir os dados de uma mídia não volátil**.
  - Vantagem: Maior integridade dos dados, menos risco de contaminação.
  - **Desvantagem: Perda de evidências voláteis (RAM, processos ativos).** 
  - Uso: Discos rígidos, pendrives, dispositivos com armazenamento persistente. 
- Aquisição Live (Live Forensics):
  - Método: Coletar dados de um sistema em execução. 
  - Vantagem: Captura de evidências voláteis (RAM, conexões de rede, processos).
  - Desvantagem: Maior risco de modificar a evidência, processo complexo.
  - Uso: Análise de malware, sistemas comprometidos.

---

## Ordem de Coleta de Evidências Voláteis (ORDEM DE VOLATILIDADE)

> Regra!
>
> O que desaparece mais rápido deve ser coletado primeiro

Princípio: Coletar as evidências mais voláteis primeiro, antes que sejam perdidas.

Sequência Típica (do mais volátil para o menos volátil

1. **Registros de CPU e Cache**: Quase impossíveis de capturar sem equipamentos especializados.
2. **Conteúdo da Memória RAM**: Processos ativos, chaves, senhas. 
3. **Estado da Rede**: Conexões abertas, tabelas de roteamento, ARP cache.
4. **Processos em Execução**: Lista de processos, serviços, handles abertos. 
5. **Conteúdo de Disco Temporário/Swap**: Dados que foram para o arquivo de paginação. 
6. **Logs do Sistema**: Event logs, logs de segurança (em alguns casos, podem ser mais persistentes).

Objetivo: **Maximizar a captura de dados que desapareceriam com o desligamento**.

---

## Aquisição de Imagem de Disco (Forensic Imaging)

- **Definição**: Criação de uma cópia bit a bit exata de uma mídia de armazenamento.
- **Diferença de Cópia Simples**: Inclui espaço não alocado, slack space, e setores ocultos (Host Protected Area - HPA). 
- **Formatos Comuns**: 
  - E01 (EnCase Forensic Image File)
  - AFF (Advanced Forensic Format)
  - RAW (dd image). 

- **Ferramentas**: 
  - FTK Imager
  - AccessData Imager
  - EnCase Forensic
  - Guymager (Linux)
  - dd (Linux)

- Processo: 
  1. Conectar disco original a write-blocker. 
  2. Conectar disco de destino (vazio, maior que o original). 
  3. Executar ferramenta de imagem forense.
  4. Calcular hash da fonte e destino.

---

## Aquisição de Memória RAM (Memory Forensics)

- **Objetivo**: Capturar o conteúdo da memória volátil de um sistema em execução.
- **Informações Fundamentais**: 
  - Processos ativos
  - conexões de rede abertas
  - senhas em plaintext
  - chaves de criptografia
  - atividade de malware.

- **Ferramentas**: 
  - Volatility Framework
  - WinPMEM
  - LinPMEM
  - DumpIt. 

- Processo: 
  - 1. Executar a ferramenta de aquisição de RAM (localmente ou via rede). 
    2. Salvar o dump da memória em uma mídia de destino externa e limpa.
    3. Calcular o hash do dump. 
- Desafio: **O próprio ato de coletar altera a memória**.

***A memória RAM é um lugar rico de informações***

---

## Aquisição de Evidências em Nuvem

- Desafio: Falta de acesso físico direto aos servidores. 

- Abordagens:

  - Acordos com Provedores (Legal): Mandados judiciais ou requisições legais para acesso aos dados.
  - APIs e Ferramentas do Provedor: Uso de APIs e ferramentas específicas para exportar logs, snapshots de VMs, volumes de armazenamento.
  - Aquisição Live (em VMs): Se tiver acesso à VM, coletar memória/disco dentro do ambiente em nuvem.

  - Considerações: Termos de serviço do provedor, jurisdição, privacidade.

  - Exemplos: AWS S3 buckets, Google Drive, Microsoft Azure Storage.

---

## Aquisição de Evidências em Dispositivos Móveis

- Desafio:
  - Diversidade de sistemas (iOS, Android), modelos, hardwares. 
  - Criptografia de disco completa (**FDE**) padrão. 
  - Bloqueios de tela (PIN, biometria).
  - Conexão constante à rede, alterando evidências. 
  - Dificuldade de acesso físico (soldado, baterias internas).
- Métodos: 
  - Logical Acquisition: Extração de dados visíveis (arquivos, contatos, SMS). 
  - Physical Acquisition: Cópia bit a bit da memória flash (exige root/jailbreak, ou ferramentas forenses). 
  - Chip-off Forensics: Remoção física do chip de memória. 
  - JTAG/ISP: Acesso à memória via pinos de teste.
  - Ferramentas: 
    - Cellebrite UFED
    - XRY
    - Oxygen Forensics.

---

## Coleta de Evidências de Rede (Network Forensics) 

- Objetivo: Monitorar e analisar o tráfego de rede para identificar atividades suspeitas ou maliciosas
- Fontes de Dados: 
  - Capturas de Pacotes (Packet Capture): Dados brutos de tráfego de rede (full content). 
  - Dados de Fluxo (Flow Data): Metadados de conexão (quem, quando, para onde, quanto). 
    - Ex: 
      - NetFlow
      - IPFIX.
      - Logs de Dispositivos de Rede:
        - Firewalls
        - roteadores
        - IDS/IPS.
  - Ferramentas:
    - Wireshark
    - tcpdump (captura) 
    - Zeek (Bro)
    - Suricata (análise IDS) 
    - ELK Stack (logs)
- Desafio: Volume de dados, criptografia de tráfego (HTTPS).