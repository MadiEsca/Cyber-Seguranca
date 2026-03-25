# Camada 6 — Apresentação (Presentation Layer)

A Camada 6 existe para resolver um problema fundamental: **dois sistemas podem representar os mesmos dados de formas completamente diferentes internamente**. A Camada 6 é o tradutor — ela garante que os dados que saem de um sistema sejam interpretados corretamente pelo outro, independente de arquitetura, sistema operacional ou aplicação.

## Três responsabilidades reais:

### 1. Tradução e Formatação de Dados

Diferentes sistemas usam diferentes representações para o mesmo dado. O exemplo clássico é a codificação de caracteres:

- Um sistema usando **ASCII** representa a letra "A" como `0x41`
- Um sistema usando **EBCDIC** (IBM mainframes) representa "A" como `0xC1`
- Um sistema usando **UTF-8** representa caracteres fora do ASCII com sequências multi-byte

Sem a Camada 6 fazendo a tradução, um arquivo de texto enviado de um mainframe IBM para um servidor Linux seria ilegível. Isso parece arcaico, mas é exatamente o problema que acontece hoje quando aplicações web não especificam charset correto — você vê aqueles caracteres estranhos no lugar de acentos. Isso é falha de Camada 6.

Outros exemplos de tradução que acontecem aqui:

- **Big-endian vs Little-endian** — a ordem em que bytes são armazenados difere entre arquiteturas (Intel x86 é *little-endian*, redes TCP/IP usam *big-endian*, chamado "network byte order"). A conversão acontece nesta camada 6.
- **Formatos de dados estruturados** — JSON, XML, ASN.1 são formatos de Camada 6. Quando um servidor LDAP envia dados em ASN.1 BER e sua aplicação precisa interpretar, isso é Camada 6.

------

### 2. Criptografia e Descriptografia

Esta é a função mais relevante na competição.

**TLS (Transport Layer Security)** — tecnicamente opera entre a Camada 4 e a Camada 7, mas a função de cifrar e decifrar o *payload* de dados é responsabilidade da Camada 6. Quando você configura HTTPS no servidor web, você está configurando uma função de Camada 6.

#### O que acontece na prática:

- O dado sai da Camada 7 (HTTP payload) em texto claro.
- A Camada 6 cifra usando o algoritmo negociado (AES-256-GCM, por exemplo) com a chave de sessão estabelecida pelo **TLS handshake**.
- O dado cifrado desce pelas camadas inferiores.
- No destino, a Camada 6 decifra antes de entregar à Camada 7.

**Implicação direta para o Módulo 1:** quando você configura *SSL Inspection* no Squid dentro do pfSense, você está essencialmente fazendo um *man-in-the-middle* legítimo na Camada 6 — o pfSense decifra o tráfego HTTPS, inspeciona, e re-cifra antes de encaminhar. Para isso funcionar, o certificado da CA do pfSense precisa ser *trusted* pelos clientes. Sem entender que a **criptografia vive na Camada 6**, você não entende por que esse processo funciona dessa forma.

**Implicação para o Módulo 3/5:** C2 sobre HTTPS é tráfego cifrado de Camada 6. Um IDS sem SSL inspection (Suricata em modo passivo sem decriptografia) vê apenas metadados de Camada 4 — IP, porta, volume — mas não o conteúdo. É por isso que comunicação C2 moderna usa HTTPS: ela se mistura com tráfego legítimo e o payload é invisível para inspeção de Camada 4.

------

### 3. Compressão e Descompressão

A Camada 6 pode comprimir dados antes de transmitir para reduzir a quantidade de dados enviados pela rede, e descomprimir no destino.

Exemplos práticos:

- **HTTP/1.1 com gzip/deflate** — o servidor comprime o body da resposta HTTP na Camada 6, o cliente descomprime. O header `Content-Encoding: gzip` é o indicador.
- **HTTP/2** usa compressão de headers (HPACK) que também opera nesta camada
- **RDP** comprime o stream de vídeo da sessão remota

**Relevância para segurança:** compressão antes de criptografia é um vetor de ataque chamado **CRIME** (Compression Ratio Info-leak Made Easy) e **BREACH**. Se você comprime e depois cifra, o tamanho do ciphertext pode vazar informação sobre o plaintext porque compressão é sensível a padrões repetidos. Esse é um exemplo de onde entender Camada 6 te dá vocabulário para entender vulnerabilidades reais.

------

## Por que a Camada 6 é "invisível" na prática

Na implementação real do TCP/IP, não existe uma camada de apresentação separada. **As funções de Camada 6 são absorvidas** pelos **protocolos de aplicação** ou por **bibliotecas usadas pelas aplicações**:

- **TLS** é implementado como biblioteca (OpenSSL, LibreSSL, BoringSSL) chamada pela aplicação.
- Codificação de caracteres é responsabilidade do desenvolvedor da aplicação.
- **Compressão é configurada no servidor web** ou **no protocolo de aplicação**.

Isso significa que na prática, quando você analisa tráfego no Wireshark, você não vai ver "Camada 6" separado. Você vai ver TLS como parte do stream TCP, e o payload dentro do TLS como dados da aplicação.

------

## O que você precisa saber para a competição especificamente

**Módulo 1 (pfSense):**

- SSL Inspection no Squid = inspeção de Camada 6. Exige CA configurada, certificado distribuído aos clientes
- Configuração de criptografia em OpenVPN = parâmetros de Camada 6: cipher (AES-256-GCM), auth (SHA256), tls-auth/tls-crypt

**Módulo 2 (Bug Fixing):**

- Uso incorreto de criptografia em código é vulnerabilidade de Camada 6: MD5 para hashing de senhas, ECB mode em vez de CBC/GCM, chaves hardcoded
- Transmissão de dados sensíveis sem TLS = ausência de proteção de Camada 6

**Módulo 5 (Red Team):**

- Identificar tráfego cifrado fraco (TLS 1.0, cipher suites fracas) = reconhecer configuração inadequada de Camada 6
- Explorar SSL stripping = forçar downgrade de HTTPS para HTTP, removendo proteção de Camada 6
