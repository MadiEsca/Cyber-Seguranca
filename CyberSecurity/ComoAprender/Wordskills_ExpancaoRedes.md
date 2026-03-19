# Módulo de Redes — Expansão Completa
### Baseado no Descritivo Técnico #39 (Gestão de Sistemas de Redes e TI)
### Suplemento ao Guia WorldSkills #54 — Segurança Cibernética (Prioridade)

---

## Por que Redes Merecem um Módulo Próprio

O guia anterior introduziu redes como fundação necessária para a segurança cibernética — e continua sendo verdade. Mas o Descritivo Técnico #39 revela que o nível de profundidade esperado vai muito além do que um estudante de segurança tipicamente aprende. Ele cita como referência as certificações **CCNA** e **ENARSI** da Cisco, o que representa uma trilha de conhecimento completa em engenharia de redes. Isso não é por acidente: um profissional de segurança que não entende switching, roteamento dinâmico e redundância de rede está cego perante metade dos ataques e incidentes que precisa investigar.

A forma mais eficiente de pensar neste módulo é a seguinte: tudo que o #39 exige como habilidade de administração de redes, o #54 vai transformar em habilidade de análise e defesa dessas redes. Você está aprendendo redes duas vezes, de ângulos complementares. Essa sobreposição é uma vantagem enorme se você estudar os dois juntos.

**Estimativa de tempo total para este módulo expandido: 8 a 10 semanas**, com prática diária em laboratório virtual.

---

## BLOCO 1 — O Modelo OSI Revisitado: Do Teórico ao Operacional

### 1.1 Por que o OSI importa na prática competitiva

A maioria dos estudantes trata o modelo OSI como uma tabela de memorização. Isso é desperdiçar o modelo. O valor real do OSI é que ele é um **framework de diagnóstico**: quando algo não funciona, você começa da Camada 1 (física) e sobe até encontrar onde a comunicação falha. Em competição, onde cada minuto conta, pensar em camadas elimina tentativas aleatórias.

Imagine que dois hosts na mesma rede não se comunicam. Se você pensa em camadas, você pergunta: "O cabo está bom? (L1) O switch está encaminhando o frame? (L2) O endereço IP está correto? (L3) A porta TCP está aberta? (L4) O serviço está respondendo? (L7)." Essa cadeia de raciocínio transforma diagnóstico de rede em algo sistemático.

**As sete camadas e o que você precisa dominar em cada uma:**

A **Camada 1 (Física)** trata de sinais elétricos, cabos, conectores e taxas de transmissão. Para a competição, você não vai cravar cabos, mas precisa saber que problemas de L1 (cabo danificado, NIC defeituosa, duplex mismatch) se manifestam como perdas de pacotes intermitentes ou desconexões — e que nenhuma configuração de software vai resolver um problema de hardware.

A **Camada 2 (Enlace de Dados)** é onde o Ethernet opera. Os conceitos essenciais aqui são endereços MAC, a tabela de endereços MAC dos switches (CAM table), e o protocolo STP (Spanning Tree Protocol). O STP é particularmente importante tanto para administração quanto para segurança — ataques como BPDU spoofing e MAC flooding exploram exatamente as características desta camada. Entenda como o switch toma a decisão de encaminhar ou inundar um frame, e o que acontece quando a tabela CAM está cheia (MAC flood attack).

A **Camada 3 (Rede)** é onde o IP opera. Esta é a camada mais crítica para roteamento e sub-netting. Todo o roteamento dinâmico (OSPF, BGP, EIGRP) opera nesta camada. É aqui também que o firewall baseado em IP filtra tráfego.

A **Camada 4 (Transporte)** é onde TCP e UDP vivem. Para segurança, esta camada é fundamental porque determina o comportamento de conexão — o three-way handshake TCP é o que possibilita SYN flood attacks; a ausência de handshake no UDP é o que possibilita ataques de amplificação DNS e NTP.

As **Camadas 5, 6 e 7 (Sessão, Apresentação, Aplicação)** são frequentemente tratadas como um bloco na prática. É onde protocolos como HTTP, SMTP, DNS, FTP e SSH operam. Do ponto de vista de segurança, a maioria das vulnerabilidades exploradas em aplicações web e serviços de rede vive aqui.

---

## BLOCO 2 — Switching e VLANs: A Arquitetura Interna das Redes

### 2.1 Hierarquia de switching: Core, Distribuição e Acesso

O #39 menciona explicitamente "configurar o acesso, a agregação e a comutação em nível de núcleo", o que se refere ao modelo hierárquico de três camadas da Cisco — um padrão da indústria que você precisa entender profundamente porque representa como redes corporativas reais são construídas.

A **camada de acesso** é onde os dispositivos finais (computadores, telefones, câmeras) se conectam à rede. Switches de acesso são configurados com portas de acesso (access ports) atribuídas a VLANs específicas, com funcionalidades de segurança como port security, DHCP snooping, dynamic ARP inspection, e 802.1X para autenticação.

A **camada de distribuição** agrega o tráfego dos switches de acesso e aplica políticas de roteamento e segurança entre VLANs. É aqui que inter-VLAN routing acontece, onde ACLs (Access Control Lists) são aplicadas para controlar quem pode falar com quem entre segmentos, e onde QoS (Quality of Service) é configurado.

A **camada de núcleo (core)** é responsável pela transmissão rápida de grandes volumes de tráfego. Aqui o foco é em alta disponibilidade e velocidade, com redundância de links e protocolos de failover.

### 2.2 VLANs: Segmentação Lógica de Redes

Uma VLAN (Virtual Local Area Network) permite dividir um switch físico em múltiplas redes lógicas isoladas. Para a competição de segurança, VLANs são o principal mecanismo de implementação da DMZ e segmentação de rede que o Módulo 1 exige. Um erro comum é confundir segmentação física (equipamentos separados) com lógica (VLANs no mesmo switch) — ambas têm implicações de segurança diferentes.

**O que você precisa dominar sobre VLANs:**

Portas de acesso (access ports) e portas de tronco (trunk ports) são os dois tipos fundamentais. Uma porta de acesso pertence a uma única VLAN e é conectada a um dispositivo final. Uma porta de tronco carrega múltiplas VLANs através do encapsulamento 802.1Q, que adiciona uma tag de 4 bytes ao frame Ethernet identificando a qual VLAN ele pertence. Você precisa configurar trunks entre switches e entre switches e roteadores para inter-VLAN routing.

O protocolo VTP (VLAN Trunking Protocol) sincroniza configurações de VLAN entre switches em um domínio. Entenda os modos: Server (propaga VLANs), Client (recebe VLANs), e Transparent (não propaga, mas encaminha). Em ambientes de competição, VTP transparente é frequentemente preferido para evitar propagação acidental de configurações.

Inter-VLAN routing pode ser feito de duas formas: "Router on a Stick" (uma interface física no roteador com subinterfaces para cada VLAN) ou via switch L3 com interfaces de VLAN (SVIs — Switched Virtual Interfaces). A segunda é mais eficiente e comum em ambientes modernos.

**Ataques relacionados a VLANs que você precisa entender:**

VLAN hopping é a técnica de enviar tráfego de uma VLAN para outra sem passar pelo roteador. A versão mais comum é o switch spoofing, onde um atacante configura sua porta de acesso para negociar um trunk (usando DTP — Dynamic Trunking Protocol), ganhando acesso a todas as VLANs. A contramedida é desabilitar DTP explicitamente em todas as portas de acesso (`switchport nonegotiate`). A segunda versão é double tagging, onde o atacante envia um frame com duas tags 802.1Q — a primeira tag é removida pelo switch, mas o frame continua viajando com a segunda tag para outra VLAN.

### 2.3 Spanning Tree Protocol (STP): Redundância Sem Loops

O STP existe para resolver um problema fundamental: redes com redundância de links criam loops que destroem a rede com broadcast storms. O STP elege uma root bridge e desabilita caminhos redundantes, mantendo-os em standby para failover. Versões modernas incluem RSTP (Rapid STP — converge em segundos em vez de 30-50 segundos) e MSTP (Multiple STP — uma instância de STP por grupo de VLANs).

Do ponto de vista de segurança, o STP é um vetor de ataque. Se um atacante consegue tornar seu dispositivo a root bridge (enviando BPDUs com prioridade 0), ele pode redirecionar todo o tráfego da rede por seu dispositivo — um ataque de man-in-the-middle silencioso. As contramedidas são PortFast (em portas de acesso), BPDU Guard (desabilita a porta se receber um BPDU), e Root Guard (impede que uma porta se torne uma porta root). Você precisa configurar estas features em todos os switches.

---

## BLOCO 3 — Endereçamento IP: IPv4 e IPv6 em Profundidade

### 3.1 IPv4: Sub-netting Avançado

O sub-netting precisa ser automático para você. Na competição, você vai receber um espaço de endereçamento e precisará dividí-lo em sub-redes para diferentes segmentos (WAN, LAN, DMZ, gestão) em segundos. Pratique até não precisar mais de calculadora.

**O processo de sub-netting que você deve automatizar:**

Dado um endereço de rede como 192.168.10.0/24 e a necessidade de criar 4 sub-redes, você precisa saber imediatamente que precisa de 2 bits de host emprestados (2² = 4), resultando em /26 (26 bits de rede), com 64 endereços por sub-rede (sendo 62 utilizáveis), e as quatro sub-redes seriam: .0/26 (hosts .1-.62, broadcast .63), .64/26 (hosts .65-.126, broadcast .127), .128/26 (hosts .129-.190, broadcast .191), .192/26 (hosts .193-.254, broadcast .255).

VLSM (Variable Length Subnet Masking) vai além do sub-netting uniforme — você aloca sub-redes de tamanhos diferentes conforme a necessidade. Um link ponto-a-ponto entre roteadores precisa de apenas 2 hosts (/30), enquanto um segmento de servidores pode precisar de 30 hosts (/27). VLSM maximiza a utilização do espaço de endereçamento.

Sumarização de rotas (route summarization) é a capacidade de combinar múltiplas rotas específicas em uma rota resumida mais genérica. Se você tem 192.168.0.0/24, 192.168.1.0/24, 192.168.2.0/24, e 192.168.3.0/24, você pode sumarizá-las como 192.168.0.0/22. Isso reduz o tamanho das tabelas de roteamento e melhora o desempenho da rede.

### 3.2 IPv6: Não é Optional

O #39 cita IPv6 explicitamente, e com razão: a exaustão de endereços IPv4 tornou IPv6 uma realidade operacional em muitos ambientes. Competidores que ignoram IPv6 chegam à competição com uma lacuna visível.

**O que você precisa entender sobre IPv6:**

Endereços IPv6 têm 128 bits (em vez de 32 do IPv4), escritos como 8 grupos de 4 dígitos hexadecimais separados por dois pontos, como `2001:0db8:85a3:0000:0000:8a2e:0370:7334`. Regras de abreviação: zeros à esquerda em cada grupo podem ser omitidos, e um único grupo de zeros consecutivos pode ser substituído por `::`. O endereço anterior se torna `2001:db8:85a3::8a2e:370:7334`.

Tipos de endereços IPv6 que você precisa distinguir: **Link-local** (fe80::/10) é automaticamente configurado em toda interface e é usado apenas dentro do segmento local, nunca roteado. **Global Unicast** (2000::/3) é o equivalente ao IPv4 público — endereçamento globalmente roteável. **Unique Local** (fc00::/7) é o equivalente ao IPv4 privado — roteável internamente mas não na internet pública. **Multicast** (ff00::/8) substitui o broadcast do IPv4.

NDP (Neighbor Discovery Protocol) substitui o ARP do IPv4. Ele usa mensagens ICMPv6 para descobrir vizinhos na mesma rede (Neighbor Solicitation e Neighbor Advertisement), encontrar o gateway (Router Solicitation e Router Advertisement), e detectar endereços duplicados (DAD — Duplicate Address Detection). Ataques de ND spoofing são o equivalente IPv6 do ARP spoofing.

DHCPv6 e SLAAC (Stateless Address Autoconfiguration): ao contrário do IPv4 onde DHCP é quase universal para endereços dinâmicos, o IPv6 tem dois mecanismos. SLAAC permite que um host configure seu próprio endereço usando o prefixo anunciado pelo roteador mais um identificador gerado localmente (derivado do MAC ou aleatório). DHCPv6 funciona de forma mais similar ao DHCP tradicional para cenários onde controle central é necessário.

---

## BLOCO 4 — Roteamento Dinâmico: OSPF, BGP e EIGRP

Este é o coração do que o #39 exige e o que a maioria dos estudantes de segurança nunca aprende adequadamente. Roteamento dinâmico é como roteadores descobrem e compartilham informações sobre caminhos na rede automaticamente, sem configuração manual de cada rota.

### 4.1 OSPF — Open Shortest Path First

OSPF é o protocolo de roteamento de gateway interno (IGP) mais amplamente utilizado em redes corporativas. Ele usa o algoritmo de Dijkstra para calcular o caminho de menor custo (baseado em bandwidth, por padrão) para cada destino.

**Conceitos fundamentais do OSPF que você precisa dominar:**

OSPF divide a rede em áreas para escalar. A Área 0, chamada de backbone area, é obrigatória e conecta todas as outras áreas. Roteadores ABR (Area Border Routers) conectam áreas não-backbone à área 0. Esta hierarquia reduz o tamanho do banco de dados de topologia (LSDB — Link State Database) em cada roteador.

O processo de estabelecimento de adjacências OSPF passa por vários estados: Down → Init → 2-Way → Exstart → Exchange → Loading → Full. Entender esses estados é essencial para diagnóstico: se dois roteadores ficam presos em 2-Way, geralmente é um problema de configuração de tipo de rede ou MTU mismatch.

Em redes multi-acesso como Ethernet, o OSPF elege um DR (Designated Router) e um BDR (Backup Designated Router) para reduzir a quantidade de adjacências. Todos os outros roteadores trocam informações de roteamento com o DR/BDR em vez de entre si.

Tipos de LSA (Link State Advertisement): cada tipo de LSA carrega informações diferentes sobre a topologia. LSA Type 1 (Router LSA) lista os links do próprio roteador. LSA Type 2 (Network LSA) representa um segmento multi-acesso. LSA Type 3 (Summary LSA) carrega informações de rotas entre áreas. LSA Types 5 e 7 carregam rotas externas (redistribuídas de outros protocolos).

**OSPF e segurança:** OSPF suporta autenticação MD5 para proteger as atualizações de roteamento. Sem autenticação, um atacante poderia injetar rotas falsas no domínio OSPF e redirecionar tráfego. Configure sempre autenticação em ambientes de competição.

### 4.2 EIGRP — Enhanced Interior Gateway Routing Protocol

EIGRP é um protocolo Cisco proprietário (mas agora parcialmente aberto) que combina características de protocolos de vetor de distância e estado de link. Ele usa o algoritmo DUAL (Diffusing Update Algorithm) que garante loop-free path selection e convergência rápida.

O diferencial do EIGRP é a combinação de métricas: bandwidth, delay, reliability, load, e MTU. Na prática, apenas bandwidth e delay são usados por padrão. O EIGRP mantém uma tabela de topologia com o Successor (melhor caminho) e o Feasible Successor (backup pré-calculado) para cada destino — quando o caminho principal falha, o Feasible Successor é promovido imediatamente sem necessidade de recalcular.

EIGRP usa o conceito de sistema autônomo (AS number) para identificar domínios EIGRP. Roteadores apenas formam adjacências com outros roteadores no mesmo AS. EIGRP também suporta sumarização manual e redistribuição de rotas de outros protocolos.

### 4.3 BGP — Border Gateway Protocol

BGP é o protocolo de roteamento da internet — o único protocolo EGP (Exterior Gateway Protocol) em uso hoje. Enquanto OSPF e EIGRP são usados dentro de uma organização, BGP é usado entre organizações (entre provedores de internet, entre uma empresa e seu ISP, em redes multi-homed).

Para a competição, o BGP provavelmente aparece em cenários de conectividade WAN e multi-homed. **iBGP** (internal BGP) é usado entre roteadores dentro do mesmo Sistema Autônomo (AS). **eBGP** (external BGP) é usado entre ASs diferentes.

BGP é um protocolo de vetor de caminho (path-vector): ele carrega não apenas o destino, mas o caminho completo de ASs pelo qual um prefixo pode ser alcançado. Isso permite que cada AS tome decisões de roteamento baseadas em políticas, não apenas em métricas.

Atributos de rota do BGP que você precisa conhecer: **AS-PATH** (lista de ASs pelo qual o prefixo passou, previne loops), **NEXT-HOP** (endereço do próximo salto), **LOCAL-PREF** (preferência local, maior valor é preferido, usado em iBGP), **MED** (Multi-Exit Discriminator, sugere ao vizinho externo qual caminho preferir para entrar no AS), **ORIGIN** (como a rota foi originada), e **Communities** (rótulos arbitrários para aplicar políticas).

**BGP e segurança:** BGP hijacking é um dos ataques mais sérios em infraestrutura de internet — um AS anuncia prefixos que não lhe pertencem, redirecionando tráfego global. Entenda como RPKI (Resource Public Key Infrastructure) e prefix filtering são usados para mitigar isso.

---

## BLOCO 5 — Alta Disponibilidade: Redundância de Camada 3 e Camada 2

### 5.1 Protocolos de Redundância de Gateway (FHRP)

O #39 cita GLBP, HSRP, e VRRP como habilidades requeridas. Esses são protocolos de First Hop Redundancy (FHRP) — eles resolvem o problema de ponto único de falha no gateway padrão dos hosts.

**HSRP (Hot Standby Router Protocol)** é um protocolo Cisco proprietário onde um roteador ativo e um standby compartilham um IP virtual. Os hosts configuram o IP virtual como seu gateway. Se o roteador ativo falha, o standby assume o IP virtual em segundos. Apenas um roteador encaminha tráfego por vez (Active/Standby).

**VRRP (Virtual Router Redundancy Protocol)** é o equivalente padrão do HSRP (RFC 5798), funcionando de forma similar mas compatível com múltiplos fornecedores. No VRRP, o roteador Master encaminha tráfego e os Backup esperam. Uma diferença importante: o VRRP pode usar o IP de uma interface real como o IP virtual, enquanto o HSRP requer um IP separado.

**GLBP (Gateway Load Balancing Protocol)** é exclusivo da Cisco e vai além de simples redundância — ele distribui tráfego entre múltiplos gateways simultaneamente. Um AVG (Active Virtual Gateway) coordena os AVFs (Active Virtual Forwarders), atribuindo diferentes endereços MAC virtuais para diferentes hosts, de forma que o tráfego é distribuído entre os roteadores disponíveis.

Para configurar qualquer um desses protocolos você precisa definir o grupo (número de 0-255 para HSRP, 0-255 para GLBP, 1-255 para VRRP), o IP virtual compartilhado, e opcionalmente a prioridade (para influenciar qual roteador se torna ativo). Preemption (retomada automática do papel ativo quando o roteador original se recupera) geralmente precisa ser habilitado explicitamente no HSRP.

### 5.2 Link Aggregation: LACP e PAgP

LACP (Link Aggregation Control Protocol, IEEE 802.3ad) e PAgP (Port Aggregation Protocol, Cisco proprietário) permitem combinar múltiplos links físicos em um único link lógico (EtherChannel ou Port Channel). Isso oferece dois benefícios simultâneos: aumento de largura de banda (múltiplos links paralelos) e redundância (se um link falha, o EtherChannel continua usando os restantes).

LACP opera em dois modos: **Active** (inicia negociação) e **Passive** (aguarda negociação). Para formar um EtherChannel, pelo menos um lado deve estar em Active. PAgP tem modos **Desirable** (ativo) e **Auto** (passivo), com a mesma regra.

Erros comuns na configuração de EtherChannel que aparecem na competição: mistura de diferentes velocidades ou duplex nos links físicos, inconsistência no modo de switchport (access vs. trunk), configuração de VLAN diferente, ou diferentes valores de STP port cost. Todos esses erros impedem a formação do EtherChannel e é necessário verificá-los sistematicamente.

---

## BLOCO 6 — VPNs: Conectividade Segura Entre Sites e Usuários

O #39 lista vários tipos de VPN como habilidades requeridas, e o #54 os usa como parte do Módulo 1 (especialmente OpenVPN para acesso remoto seguro). Entender a teoria por trás de cada tipo de VPN ajuda você a configurar e diagnosticar problemas muito mais rapidamente.

### 6.1 IPSec — O Framework de Segurança para VPNs

IPSec não é um único protocolo, mas um conjunto de protocolos que trabalham juntos. Entender cada componente é essencial para diagnosticar problemas de configuração.

**IKE (Internet Key Exchange)** é responsável pela negociação e estabelecimento da SA (Security Association) — o conjunto de parâmetros acordados entre os pares. Existem duas fases: **IKE Fase 1** estabelece um canal seguro bidirecional entre os dois pares (usando Diffie-Hellman para troca de chaves sem expô-las), e **IKE Fase 2** negocia os parâmetros para o túnel de dados real. IKEv2 é mais eficiente e seguro que IKEv1.

**AH (Authentication Header)** fornece autenticação e integridade, mas não criptografia. Por isso, AH não é suficiente quando os dados precisam de confidencialidade.

**ESP (Encapsulating Security Payload)** fornece autenticação, integridade E criptografia. ESP é o componente mais utilizado na prática.

IPSec opera em dois modos: **Modo Transporte** (protege apenas o payload do pacote, mantendo o cabeçalho IP original — usado para comunicação host-to-host) e **Modo Túnel** (encapsula o pacote IP inteiro dentro de um novo pacote IP — usado para VPNs site-to-site, onde os gateways criam o túnel).

**Site-to-Site IPSec:** configuração típica em competições onde duas redes em locais diferentes precisam se comunicar de forma segura. Os parâmetros que precisam coincidir em ambos os lados (chamados de crypto policy): algoritmo de criptografia (AES-256 é o padrão atual), algoritmo de hash/integridade (SHA-256 ou superior), grupo Diffie-Hellman (grupo 14 ou superior para segurança adequada), e método de autenticação (PSK — pre-shared key — ou certificados).

### 6.2 SSL/TLS VPN

Enquanto IPSec opera na Camada 3, SSL/TLS VPNs operam na Camada 7 (Aplicação). A vantagem é que funcionam através de firewalls e NAT sem configuração especial, pois usam HTTPS (porta 443). A desvantagem é que geralmente exigem um cliente de software no endpoint.

VPNs SSL são tipicamente usadas para acesso remoto de usuários individuais a recursos corporativos. O modelo mais comum é clientless (apenas um navegador web) para acesso a aplicações específicas, ou full-tunnel client (software instalado) para acesso completo à rede.

### 6.3 OpenVPN

OpenVPN é uma solução de VPN open-source que usa TLS para o canal de controle e o protocolo de tunnel pode usar UDP (mais eficiente) ou TCP (mais confiável, mas mais lento em redes com perda de pacotes). Ele é altamente configurável e funciona em praticamente qualquer plataforma.

A configuração do OpenVPN que você precisa dominar envolve: geração de PKI (usando easy-rsa ou OpenSSL diretamente para criar CA, certificados de servidor e de cliente), configuração do servidor (endereço de rede do túnel, push de rotas para os clientes, configuração de criptografia), e distribuição de configurações de cliente. No pfSense (Módulo 1 da competição #54), o OpenVPN é configurado através da interface gráfica, mas entender o que cada parâmetro faz torna a configuração muito mais rápida e o diagnóstico de problemas muito mais eficaz.

### 6.4 DMVPN — Dynamic Multipoint VPN

DMVPN é uma solução Cisco para redes com muitos sites (hub-and-spoke ou full-mesh). Em vez de configurar túneis estáticos entre cada par de sites (o que se torna impraticável com dezenas de filiais), o DMVPN usa um hub central que registra dinamicamente os spokes. Spokes podem criar túneis dinâmicos diretamente entre si sem passar pelo hub, usando o protocolo NHRP (Next Hop Resolution Protocol).

DMVPN opera em três fases: Fase 1 (todo tráfego vai pelo hub), Fase 2 (tunnels dinâmicos spoke-to-spoke são possíveis), e Fase 3 (com sumarização de rotas no hub para direcionamento mais eficiente).

### 6.5 GRE — Generic Routing Encapsulation

GRE é um protocolo de tunneling simples que encapsula qualquer protocolo de rede dentro de pacotes IP. Por si só, o GRE não fornece segurança (sem criptografia, sem autenticação). Por isso, na prática é comum ver GRE over IPSec — o GRE cria o túnel (permitindo, por exemplo, executar protocolos de roteamento dinâmico pelo túnel), e o IPSec fornece a segurança.

Uma vantagem importante do GRE é que ele pode carregar tráfego multicast, o que o IPSec puro não consegue. Isso permite executar OSPF ou EIGRP através de túneis GRE/IPSec, tornando a topologia de roteamento mais dinâmica e resiliente.

---

## BLOCO 7 — Gerenciamento e Monitoramento de Redes

### 7.1 SNMP — Simple Network Management Protocol

SNMP é o protocolo padrão para gerenciamento de dispositivos de rede. Entender SNMP é importante tanto para administração quanto para segurança.

**Versões e suas implicações de segurança:** SNMPv1 e v2c usam community strings (basicamente senhas em texto claro) para autenticação. Qualquer um que capture o tráfego na rede pode ver a community string. **SNMPv3** introduziu autenticação real (MD5 ou SHA) e criptografia (DES ou AES) — é o único recomendado para ambientes de produção. O acesso SNMP com community string "public" ainda existente em equipamentos é frequentemente explorado em pentest para coletar informações sobre a topologia de rede.

A arquitetura SNMP consiste em: **Manager** (o sistema de gerenciamento, como Nagios, Zabbix, ou LibreNMS), **Agent** (software no dispositivo gerenciado que responde a consultas), e **MIB** (Management Information Base — a base de dados que define quais variáveis o agente pode reportar).

Dois tipos de operações: **polling** (o manager solicita informações periodicamente com GET/GETNEXT) e **traps** (o agente envia notificações proativamente ao manager quando eventos específicos ocorrem, como uma interface cair).

### 7.2 NetFlow e Análise de Tráfego

NetFlow é um protocolo Cisco para coleta de metadados de fluxos de rede — ele registra quem se comunicou com quem, quando, por quanto tempo, e com qual volume, sem capturar o conteúdo dos pacotes. Isso o torna inestimável para análise de segurança porque: é computacionalmente eficiente (não captura payloads), preserva contexto histórico (você pode ver fluxos de dias atrás), e permite detectar padrões anômalos (como comunicação com IPs de C2 conhecidos ou exfiltração de dados por volume incomum).

Ferramentas de análise de NetFlow que você deve conhecer: **ntopng** e **ELK Stack com configuração específica de NetFlow** para visualização, **nfdump** para análise em linha de comando. Para o Módulo 2 de investigação forense e o Módulo 5 (Blue Team), a capacidade de analisar dados de NetFlow pode ser decisiva para reconstruir a timeline de um ataque.

### 7.3 Syslog

Syslog é o protocolo padrão para envio de logs de dispositivos de rede para um servidor centralizado. Todos os dispositivos Cisco, switches, roteadores, e servidores Linux enviam logs via Syslog. A centralização de logs é fundamental para correlação de eventos e análise forense.

Syslog define 8 níveis de severidade (0=Emergency até 7=Debug). Em ambientes de produção, tipicamente configuramos o nível 4 (Warning) ou 5 (Notice) para evitar volume excessivo de logs. Entenda como configurar dispositivos para enviar logs a um servidor syslog central, e como filtrar e pesquisar esses logs com ferramentas como ELK Stack ou Graylog.

A porta padrão é UDP 514 (sem garantia de entrega) ou TCP 514/6514 (com TLS para segurança). Para logs de segurança críticos, TCP com TLS é recomendado.

### 7.4 CDP e LLDP — Descoberta de Vizinhos

CDP (Cisco Discovery Protocol) e LLDP (Link Layer Discovery Protocol, o equivalente IEEE padrão) são protocolos que permitem que dispositivos de rede anunciem informações sobre si mesmos para vizinhos diretamente conectados. Eles revelam: nome do dispositivo, plataforma de hardware, versão do IOS, endereços IP configurados, capacidades do dispositivo, e informações de VLAN.

Do ponto de vista de administração, CDP/LLDP são valiosos para automaticamente descobrir a topologia de rede. Do ponto de vista de segurança, são um vetor de vazamento de informações. Um atacante com acesso à rede pode usar `show cdp neighbors detail` para mapear toda a topologia sem varredura ativa. A prática recomendada é desabilitar CDP/LLDP em portas de acesso voltadas para usuários, mantendo-o apenas em uplinks de infraestrutura.

### 7.5 tcpdump: Análise de Tráfego no Servidor

tcpdump é a ferramenta de linha de comando para captura e análise de tráfego em sistemas Linux. Dominar tcpdump é essencial para diagnóstico de rede e análise forense em sistemas sem interface gráfica.

A sintaxe básica é `tcpdump [opções] [filtro]`. Filtros BPF (Berkeley Packet Filter) são a forma de especificar o tráfego que você quer capturar. Você precisa saber combinar filtros: `tcpdump -i eth0 'host 192.168.1.100 and port 80'` captura tráfego HTTP de/para um host específico. `tcpdump -i any -w capture.pcap` salva tudo em arquivo para análise posterior no Wireshark.

Filtros BPF essenciais que você deve memorizar: `host [IP]` (tráfego de/para um IP), `src/dst host [IP]` (apenas da origem ou destino), `port [número]` (por porta), `net [rede/máscara]` (por sub-rede), `proto tcp/udp/icmp` (por protocolo), e combinações com `and`, `or`, `not`.

---

## BLOCO 8 — Virtualização de Redes e SDN

### 8.1 NFV — Network Function Virtualization

NFV (Network Function Virtualization) é o conceito de implementar funções de rede tradicionalmente realizadas por hardware dedicado (firewalls, balanceadores de carga, roteadores, switches) como software rodando em hardware commodity. O pfSense que você configura no Módulo 1 é um exemplo clássico de NFV — é um firewall implementado em software rodando em um servidor padrão.

O impacto do NFV para competição é que você precisa entender como ambientes virtualizados afetam a rede: conceito de vSwitch (virtual switch dentro do hipervisor), interfaces virtuais, e como tráfego flui entre VMs no mesmo host versus entre hosts diferentes.

### 8.2 SDN — Software Defined Networking

SDN separa o plano de controle (como o tráfego deve ser encaminhado — decisão) do plano de dados (encaminhamento real do tráfego). Em redes tradicionais, cada dispositivo tem seu próprio plano de controle e toma decisões independentemente. Em SDN, um controlador centralizado toma as decisões e programa o plano de dados dos dispositivos via APIs (tipicamente OpenFlow).

Na prática competitiva, o EVE-NG e Cisco Modeling Labs (CML) citados no #39 são exemplos de ambientes onde você pode simular SDN. A compreensão de SDN é mais relevante para o contexto de como redes modernas são gerenciadas do que para configuração direta na competição, mas aparece em questões de troubleshooting onde o comportamento esperado difere do tradicional.

---

## BLOCO 9 — Segurança de Rede: Fundamentos e Técnicas Específicas

Esta seção conecta o conhecimento de redes do #39 com as necessidades de segurança do #54.

### 9.1 ACLs — Listas de Controle de Acesso

ACLs em roteadores Cisco são o mecanismo básico de filtragem de tráfego na Camada 3 e 4. Entender ACLs é essencial tanto para proteger segmentos de rede quanto para entender como um firewall stateless opera.

ACLs são listas de regras processadas sequencialmente de cima para baixo — a primeira regra que corresponder ao pacote é aplicada, e o processamento para. No final de toda ACL há uma regra implícita `deny any any` que bloqueia todo tráfego não explicitamente permitido.

Dois tipos fundamentais: **ACL Standard** (filtra apenas por endereço IP de origem, identificada por números 1-99 e 1300-1999) e **ACL Extended** (filtra por endereço de origem, destino, protocolo e portas, identificada por números 100-199 e 2000-2699 ou nomes).

Posicionamento de ACLs: o princípio geral é colocar ACLs Standard o mais próximo possível do destino (porque elas só verificam a origem, bloquear próximo da origem poderia bloquear tráfego legítimo para outros destinos), e ACLs Extended o mais próximo possível da origem (para descartar tráfego indesejado o mais cedo possível, economizando recursos da rede).

### 9.2 Port Security em Switches

Port Security é um mecanismo de Camada 2 que limita quais endereços MAC podem se conectar a uma porta específica do switch. Isso mitiga ataques de MAC flooding e controla quais dispositivos podem acessar a rede.

Configurações essenciais: número máximo de MACs por porta (tipicamente 1 para estações de trabalho), o que fazer com violações (Protect — descarta silenciosamente; Restrict — descarta e incrementa o contador de violações; Shutdown — desativa a porta), e como os MACs são aprendidos (sticky — o switch aprende e armazena automaticamente, dinâmico — aprende mas não salva, estático — configurado manualmente).

### 9.3 DHCP Snooping e Dynamic ARP Inspection

**DHCP Snooping** protege contra rogue DHCP servers (servidores DHCP não autorizados que poderiam distribuir IPs e gateways maliciosos). Ele define portas como trusted (uplinks para o DHCP server legítimo) e untrusted (portas de acesso). Respostas DHCP de portas untrusted são descartadas. Como efeito colateral, o DHCP Snooping cria uma tabela de binding (IP → MAC → porta → VLAN) que é usada pelo DAI.

**Dynamic ARP Inspection (DAI)** protege contra ARP spoofing ao verificar que as respostas ARP são consistentes com o banco de dados do DHCP Snooping. Se um host tenta anunciar que o IP 192.168.1.1 tem o MAC xx:xx:xx:xx:xx:xx, mas o DHCP Snooping diz que esse IP pertence a um MAC diferente, o DAI descarta o pacote ARP. Para hosts com IP estático, você precisa configurar entradas estáticas no banco de dados do DHCP Snooping.

---

## BLOCO 10 — Laboratório de Redes: Como Construir e o Que Praticar

### 10.1 Ferramentas de Laboratório

**EVE-NG (Emulated Virtual Environment Next Generation)** é a plataforma de laboratório de redes mais usada profissionalmente. Diferente do Cisco Packet Tracer (que é uma simulação), o EVE-NG emula hardware real, rodando as imagens IOS reais dos roteadores Cisco. Isso significa que qualquer feature que funciona em hardware real funciona no EVE-NG.

A versão Community é gratuita e suficiente para a maioria dos exercícios de preparação. Você precisa obter imagens IOS separadamente (IOSv para roteadores, IOSvL2 para switches L2, e vIOS-L2 para switches L3). O EVE-NG roda como uma VM (disponível para VMware e VirtualBox) e é acessado via browser.

**GNS3** é a alternativa open-source ao EVE-NG, também amplamente usada. A diferença principal é que o GNS3 tem um cliente desktop que gerencia a topologia, enquanto o EVE-NG é puramente web-based.

**Cisco Packet Tracer** é uma simulação (não emulação) gratuita da Cisco, disponível para qualquer um com conta no Cisco NetAcad. É menos realista que o EVE-NG mas excelente para aprender conceitos básicos sem a complexidade de obter imagens IOS.

**Cisco Modeling Labs (CML)** é a versão paga e enterprise do EVE-NG/GNS3 da própria Cisco, com 20 nós gratuitos na versão pessoal. É citado diretamente no #39 como uma tecnologia requerida.

### 10.2 Roteiros de Prática Recomendados

Organize sua prática em topologias progressivamente mais complexas, cada uma adicionando novos conceitos sobre os anteriores:

**Semana 1-2 — Topologia Básica:** Dois roteadores conectados ponto-a-ponto com sub-redes diferentes em cada lado. Pratique: configuração básica de interfaces, roteamento estático, verificação com ping e traceroute. Capture o tráfego com Wireshark e observe como o ARP e o ICMP se comportam. Quebre a topologia (desconecte um link, altere um IP) e diagnostique.

**Semana 3-4 — VLANs e Inter-VLAN Routing:** Adicione dois switches com múltiplas VLANs, configure trunks entre switches e entre switch e roteador (Router on a Stick). Configure inter-VLAN routing. Teste que hosts em VLANs diferentes não se comunicam sem passar pelo roteador. Configure STP e verifique qual porta fica em blocking state.

**Semana 5-6 — Roteamento Dinâmico:** Expanda para três ou mais roteadores. Configure OSPF multi-área, verifique as adjacências e o banco de dados de topologia (LSDB). Configure sumarização manual entre áreas. Adicione redistribuição de rota estática no OSPF. Substitua o OSPF por EIGRP e compare o comportamento.

**Semana 7-8 — Alta Disponibilidade e VPN:** Configure HSRP ou VRRP entre dois roteadores e teste o failover. Configure um EtherChannel entre dois switches. Configure uma VPN IPSec site-to-site entre dois roteadores. Configure uma topologia DMVPN básica com um hub e dois spokes.

**Semana 9-10 — Segurança e Monitoramento:** Configure ACLs Extended para implementar uma política de segurança específica. Configure Port Security, DHCP Snooping e DAI nos switches. Configure SNMP v3 nos roteadores e use LibreNMS ou SNMP walk para coletar informações. Configure Syslog e envie logs de todos os dispositivos para um servidor central.

---

## BLOCO 11 — Recursos Específicos de Redes

### Recursos Gratuitos por Tema

Para o conteúdo de CCNA e fundamentos de redes, o **Cisco NetAcad** disponibiliza os cursos oficiais de CCNA gratuitamente quando acessados pelo portal de certas instituições — verifique se sua escola tem acesso. O **Packet Tracer** e seus laboratórios guiados estão disponíveis gratuitamente com registro em netacad.com.

O canal **Jeremy's IT Lab** no YouTube é o melhor recurso gratuito para CCNA — suas playlists cobrem o currículo completo com laboratórios no Packet Tracer incluídos gratuitamente em anki.

Para OSPF em profundidade, o livro **"OSPF: Anatomy of an Internet Routing Protocol"** de John Moy (o criador do OSPF) é uma leitura técnica densa mas incomparável em profundidade. Para uso mais prático, o site **routeralley.com** tem tutoriais e laboratórios de configuração objetivos.

Para BGP, **"BGP: Building Reliable Networks with the Border Gateway Protocol"** de Sam Halabi é a referência padrão. O site **bgp.potaroo.net** mantém estatísticas em tempo real sobre o estado das tabelas de roteamento BGP globais — útil para contextualizar o protocolo no mundo real.

Para DMVPN especificamente, o blog **ioshints.blogspot.com** de Ivan Pepelnjak tem artigos técnicos profundos sobre DMVPN e SDN que são amplamente citados na indústria.

### Certificações de Referência (conforme citadas no #39)

A certificação **CCNA** cobre todos os tópicos dos Blocos 1 a 7 deste módulo. Se você quer uma prova externa de que domina o material de networking, o CCNA é o benchmark universalmente reconhecido. O custo do exame é US$300, mas o valor do conhecimento acumulado no processo de estudo é independente de você fazer o exame ou não.

A certificação **ENARSI** (Implementing Cisco Enterprise Advanced Routing and Services) cobre o conteúdo avançado dos Blocos 4 a 6 em muito mais profundidade — BGP avançado, OSPF avançado, EIGRP avançado, e VPNs avançadas. Este é o nível que separa administradores de rede de engenheiros de rede sênior.

**LPIC-2** cobre administração avançada de Linux com foco em serviços de rede (DNS, DHCP, HTTP, VPN) — relevante para o conteúdo de serviços que o #39 exige.

---

## Conexão Entre os Dois Descritivos: Como o #39 Reforça o #54

Para terminar este módulo de forma estratégica, é importante que você entenda como o conhecimento aprofundado do #39 se traduz em vantagem competitiva no #54.

Quando o Módulo 1 do #54 pede para configurar um IDS/IPS (Suricata), você precisa entender roteamento e switching para saber **onde** na topologia colocar o sensor — em um SPAN port do switch? Inline entre o firewall e o switch? Monitorando a DMZ ou a LAN interna? Essa decisão arquitetural não é trivial e só faz sentido se você entende como o tráfego flui pela rede.

Quando o Módulo 5 (Blue Team) pede para analisar logs e detectar um ataque, o conhecimento de protocolos de rede (de Blocos 1 a 4 deste módulo) é o que permite você distinguir tráfego normal de tráfego anômalo. Um analista que não entende como o OSPF funciona não vai reconhecer que um flood de OSPF hellos é um ataque; um analista que não entende HSRP não vai reconhecer um HSRP coup attack nos logs.

Quando o Módulo 4 (Red Team CTF) envolve movimento lateral em uma rede segmentada, o conhecimento de VLAN hopping, trunking e inter-VLAN routing (do Bloco 2) é o que permite entender por que algumas técnicas funcionam e outras não dependendo da topologia.

O conhecimento de redes não é separado do conhecimento de segurança — ele é a camada sobre a qual toda a segurança é construída. Domine os dois juntos.
