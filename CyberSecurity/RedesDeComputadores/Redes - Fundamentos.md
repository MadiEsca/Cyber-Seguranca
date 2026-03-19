<h1 align="center" style="color:purple">A história</h1>

Antes de realmente termos as redes de computadores como as conhecemos atualmente, ou seja, de forma com que qualquer dispositivo em uma rede possa se comunicar, não tínhamos esse privilégio, de realizarmos essa comunicação com dispositivos de fabricantes diferentes .

Quando as primeiras redes de computadores surgiram, computadores de uma mesma fabricante podiam, tipicamente, comunicar-se entre si. Dessa forma, as empresas se viam obrigadas a **escolherem apenas uma determinada solução**, por exemplo *IBM* ou *DEC¹* (atual HP), por conta de sua compatibilidade.

[^1]: Digital Equipment Corp

<h2 align="center" style="color:black">Surgimento do modelo OSI</h2>

Era claro a insatisfação tanto de consumidores e usuários finais quanto dos fabricantes de componentes eletrônicos - Hardware -  e de Software. E foi pensando nisso que, na década de 80, a *ISO¹* decidiu criar o **modelo de referência OSI**, que surgia, em sua primeira versão, no ano de 1894.

Esse modelo tinha como objetivo solucionar os seguintes problemas relacionados a **padronização da comunicação de dados** da época:

- Como os dados são **formatados**
- Como os dados são **organizados**
- Como os dados são **transmitidos**
- Como os dados são **recebidos**
- Como os dados são **interpretados**
- Como os dados são **utilizados**

Onde cada uma dessas fases é representada por uma *layer* (camada) dentro do **modelo OSI**, seguidas também de *regras* (protocolos) a serem seguidas por todos os fabricantes - tanto de software quando de hardware.

**O modelo OSI é um modelo de referência**, ou seja, ele especifíca **todos** os processos para que uma comunicação de dados possa ocorrer da devida forma. Mas, como é de se esperar, sua adoção não é estritamente obrigatória, sendo possível **adotar** - protocolos cuja estrutura é conhecida como "**arquitetura de camadas**" -  **ou não** - protocolos conhecidos como **proprietários**.

O modelo OSI resolvia grande parte dos problemas enfrentados pela grande maioria de pessoas, mas  não era perfeito, longe disso, ele possuía suas vantagens e desvantagens. Diversos governos, como  *Estados Unidos* e *Brasil*, tentaram "forçar" a implantação do modelo OSI, o que claramente fracassou e, lentamente, resultou na substituição do modelo OSI por **outros modelos mais flexíveis e funcionais**.

Como por exemplo o **`TCP/IP`**, que apesar de ***não ser um modelo em si***,  mas sim um conjunto de protocolos, foi amplamente adotado, principalmente por sua ***flexibilidade*** e ***confiabilidade***. Esse "modelo" foi desenvolvido pelo *Departamento de Defesa Americano ²*, **que buscava um método para conseguir transportar dados de maneira segura mesmo em caso de um holocausto nuclear**.

[^1]: International Organization for Standardization
[^2]: DoD - Departament of Defense

Falando um pouco mais a respeito do modelo/protocolo **`TCP/IP`**. Sua ideia surgiu por meio de uma *RFP¹*, que tinha como objetivo **melhorar a operabilidade da *D.A.R.P.A Net²***, como era conhecida a Internet em seus primórdios, uma rede de comunicações baseada no chaveamento/comutação de circuitos, que tinham como "caminho" as linhas telefônicas, sendo extremamente ineficiente, devido a sua natureza atípica. Mas, essa rede se tratava de algo governamental, ou seja, não possuía muitas ramificações e muito menos era liberada para o público geral. 

A estrutura da *D.A.R.P.A Net* era extremamente hierarquizada, composta por:

- 1 nó central - Que servia como "ponte" para todos os nós de 1° nível.
- 4 nós de 1° nível - Eram conectados ao nó central e serviam como "pontes" para seus nós filhos.
- Nós de nível 2° - Eram conectados aos nós de 1° nível e serviam pontes para os nós subjacentes.
- Outros nós - Eram os computadores ou outros nós que se ligavam as estruturas de 1° e 2° nível.

Uma das maiores problemáticas dessa estrutura, **além da falta de inteligência  da rede e redundância**, era a possibilidade dessa rede ser dividida em diversas sub-redes, **incomunicáveis**, caso o nó central, ou qualquer outro, sofresse uma "pane".

Com isso, o *DoD* lançou um desafio para as universidades:

> "Criar um modelo que fosse redundante e que, até certo ponto, independente"

Ou seja, uma rede que se mantesse comunicável mesmo em caso de uma guerra nuclear;  caso algum de seus pontos seja perdido. 

[^1]: Request For Proposal - Equivalente a uma licitação
[^2]: Defense Advanced Research Projects Agency Network

---

<h1 align="center" style="color:purple">O modelo de camadas OSI</h1>

Recapitulando, nosso **Modelo de camadas OSI** foi criado pela *ISO* em 1984, como uma solução as problemáticas que surgiram em relação a comunicação de dados na época, problemáticas essas que estavam relacionadas, também, a falta de um padrão a ser seguido tanto pelos desenvolvedores de software quanto pelos fabricantes de hardware, que sofriam com a falta de compatibilidade entre os sistemas de comunicação de cada solução, como por exemplo *IBM* e *DEC* (Atual HP).

Com isso, surgiu o **Modelo de referência OSI**, que definiu como os dados seriam transmitidos de um meio físico para outra máquina. Esse modelo foi estruturado em *7* *** camadas*** (layers), de forma que cada camada ficou responsável por uma *tarefa* (ou um grupo de tarefas). **Vale ressaltar de cada camada é razoavelmente independente uma das outras**, o que torna possível associar tarefas de uma camada para outra ou até mesmo modificar determinada tarefa sem que as demais tenham que sofrer qualquer tipo de alteração.

Basicamente, as 7 camadas do modelo OSI podem ser subdivididas em **duas categorias**: 

- **Superiores** -> Camadas de aplicação (5, 6 e 7 )
  - As camadas superiores, ou de **aplicação**, lidam com assuntos relacionados a **aplicações**, sendo as camadas mais próximas dos usuários, comumente implementadas em software. 
  - Por exemplo nosso navegador quando acessamos determinado site, ele faz uma requisição a um servidor, o servidor responde e nosso navegador é responsável por exibir essas informações de forma organizada na tela.

- **Inferiores** -> Camadas de transporte (1, 2, 3 e 4)
  - São as camadas que trabalham no meio mais físico, realizando o transporte dos dados e distribuição dos dados em uma comunicação.


Vale ressaltar que **o modelo não faz a comunicação dos dados realmente existir**, ele apenas nos dá a arquitetura necessária para que isso ocorra, os responsáveis por cuidar dessa comunicação são os **protocolos**, que implementam cada uma das funções especificadas nas camadas do modelo.

  <div class="container">
    <h3 style="align-itens:center">Tabela do modelo OSI</h3>
    <table>
      <thead>
        <tr>
          <th style="width:60px">Nº</th>
          <th>Camada</th>
          <th>Nome (EN)</th>
          <th>Unidade de Dados</th>
          <th>Função Principal</th>
          <th>Exemplos de Protocolos</th>
        </tr>
      </thead>
      <tbody>
        <tr class="l7">
          <td class="layer-num">7</td>
          <td><strong>Aplicação</strong></td>
          <td><span class="badge">Application</span></td>
          <td>Dados</td>
          <td>Interface entre o usuário e a rede; serviços de rede</td>
          <td>HTTP, HTTPS, FTP, DNS, SMTP, POP3</td>
        </tr>
        <tr class="l6">
          <td class="layer-num">6</td>
          <td><strong>Apresentação</strong></td>
          <td><span class="badge">Presentation</span></td>
          <td>Dados</td>
          <td>Tradução, criptografia e compressão de dados</td>
          <td>SSL/TLS, JPEG, MPEG, ASCII</td>
        </tr>
        <tr class="l5">
          <td class="layer-num">5</td>
          <td><strong>Sessão</strong></td>
          <td><span class="badge">Session</span></td>
          <td>Dados</td>
          <td>Controle de sessões e diálogos entre aplicações</td>
          <td>NetBIOS, RPC, PPTP</td>
        </tr>
        <tr class="l4">
          <td class="layer-num">4</td>
          <td><strong>Transporte</strong></td>
          <td><span class="badge">Transport</span></td>
          <td>Segmento</td>
          <td>Entrega confiável, ou não, fim-a-fim, controle de fluxo e erros</td>
          <td>TCP, UDP</td>
        </tr>
        <tr class="l3">
          <td class="layer-num">3</td>
          <td><strong>Rede</strong></td>
          <td><span class="badge">Network</span></td>
          <td>Pacote, Datagrama</td>
          <td>Endereçamento lógico e roteamento entre redes</td>
          <td>IP, ICMP, OSPF, BGP</td>
        </tr>
        <tr class="l2">
          <td class="layer-num">2</td>
          <td><strong>Enlace de Dados</strong></td>
          <td><span class="badge">Data Link</span></td>
          <td>Quadro (Frame)</td>
          <td>Transferência confiável em um único enlace físico</td>
          <td>Ethernet, Wi-Fi (802.11), PPP, ARP</td>
        </tr>
        <tr class="l1">
          <td class="layer-num">1</td>
          <td><strong>Física</strong></td>
          <td><span class="badge">Physical</span></td>
          <td>Bit</td>
          <td>Transmissão de bits brutos pelo meio físico</td>
          <td>USB, Bluetooth, DSL, Cabos, Fibra óptica</td>
        </tr>
      </tbody>
    </table>
  </div>

---

<h1 align="center" style="color:purple">O que é uma rede de computadores</h1>

Uma rede de computadores são vários computadores conectados. Onde esses “computadores” são quaisquer dispositivos que possuem um processador, como celulares, tablets, computadores, IOT’s, etc
As redes de computadores permitem o **compartilhamento de Recursos**

Permite o compartilhamento de recursos, de forma com que em uma rede doméstica é possível compartilhar arquivos, dispositivos, etc

- **Arpanet**
- **NSFNET**

  Após o lançamento da Arpanet, as conexões foram padronizadas com o protocolo tcp/ip, mas da mesma forma, foi testado outros tipos de conexões, mas que mais se destacou foi tcp/ip.
  -
- <h1 align="center" style="color:purple">Componentes de rede</h1>
- roteadores
- cabos de rede
- data centers
- satélites
- <h1 align="center" style="color:purple">Tipos, Características e abrangências de Rede</h1>
- **PAN**
  - É um tipo de rede de **curto alcance**, funciona apenas para dispositivos que estão muito próximos, comummente dispositivos pessoais.
  - Geralmente utiliza tecnologias sem fio, como o **Bluetooth** ou o **infravermelho**, o que causa uma **conexão limitada de curta distância**.
  - Permite com que os dispositivos se comuniquem entre si diretamente, de forma com que é possível compartilhar e transferir dados entre dispositivos pessoais
  - Com isso, fica claro os benefícios dessas redes no nosso dia-a-dia de forma com que isso nos permita conectar com outros computadores e redes.
- **LAN**
  - **Rede de área local**
  - Bastante utilizada em empresas
  - Uma rede que é **geograficamente limitada**, sendo geralmente compota por dispositivos conectados a um único switch ou a um hub, onde os dispositivos podem se comunicar diretamente entre si sema necessidade de roteamento externo.
  - Os dados passados entre dispositivos são transmitidos em alta velocidade e em baixa latência.
- **WLAN**
  - **Wireless** LAN
  - É a rede LAN, mas funciona por meio de Wireless, de forma com que ela conecta dispositivos locais por meio de uma conexão sem fio
  - Uma rede limitada, da mesma forma que a LAN
  - Pode ser configurada utilizando diversos tipos de topologia, sendo um ponto de acesso único ou como uma rede Mesh, podendo cobrir uma área interna ou externa
  - A comunicação é feita por meio de ondas de rádio, o que permite uma maio flexibilidade em relação a outras rede
- **MAN**
  - **Rede de área metropolitana**
  - Uma rede de computadores que abrange uma área metropolitana. É maior que uma LAN, mas menor que uma WAN
  - Poder ser uma mescla de combinações tecnológicas, tais como fibra óptica, cabos de cobre e redes sem fio
  - Fornece uma conexão de alta velocidade dentro de uma área geográfica específica
  - Utilizada geralmente entre grandes empresas para conectarem seus escritórios e afiliaados.
- **WAN**
  - Uma rede de computadores que abrange uma grande área geográfica, como um país ou continente
  - Geralmente é composta por múltiplas LANs, interconectadas por meio de roteadores e outros dispositivos
  - Podem percorrer longas distâncias e geralmente são transmitidas por meio de provedores de serviços de telecomunicações
  - Possui uma maior latência em relação as LANs
  -
  -
- <h1 align="center" style="color:purple">Topologia de redes</h1>
  De forma resumida, a Topologia de Rede é a forma **como a estrutura de rede está organizada**
- Anel
- Estrela
- Barramento
  - Só pode ser feito por meio de **cabos**
- Mista
- Árvore
- Malha (mash)
- **A conexão não precisa necessariamente ser feita por meio de cabos**
  Sabendo da estrutura da rede, é possível planejar **ataques específicos** em **pontos específicos**.
- <h1 align="center" style="color:purple">Equipamentos de Rede</h1>
- **Modem**
  - Converte sinais digitais em analógico e vice-versa, permitindo assim o acesso a internet de várias formas, seja por linha telefônica, cabo ou fibra
- **Roteador**
  - Direciona pacotes entre redes diferentes (como a rede local e a www), atribui endereços internos (via DHCP) e gerencia conexões de rede, permitindo assim o acesso a diferentes redes
- **Switch**
  - Conecta vários dispositivos por em uma rede local (LAN), utilizando endereços MAC para enviar dados diretamente para o local correto, evitando colisões e tráfego desnecessário
- **HUB**
  - Similar ao Switch, mas transmite dados para toda a rede
- **Acess Point**
  - Permite que dispositivos se conectem à rede sem fio, funcionando como uma ponte entre a rede cabeada e a rede sem fio.
- **Firewall**
  - Dispositivo ou um software que monitora e filtra o tráfego de rede, de forma com que é possível configurar limitações e bloquear acessos não autorizados.
  - Pode ser físico ou virtual.
  - **Precisa ser configurado**
- **Servidores**
  - São os computadores dedicados somente a fornecer serviços a outros computadores, como por exemplo bancos de dados
- **Rack**
  - É utilizada para organiza e instalar equipamentos de rede, como hubs, switchs, etc
- **Placa de rede**
  - Permite a comunicação entre um computador e a rede. Podendo ser cabeada ou wirelles, de forma com que cada uma tem um endereço MAC
- **Repetidor**
  - Amplifica e transmite o sinal de rede, muito utilizado em conexões de rede de longa distância
- **Bridge**
  - Conecta duas redes locais separadas, filtrando o tráfego com base nos endereços MAC
- **Gateway**
  - Dispositivo que conecta redes com protocolos diferente, traduzindo os dados entre as duas redes, permitindo essa comunicação
- **Patch Panel**
  - Painel de conexões usado em racks para interligar e organizar cabos,
- **Controladores PoE(Power of Ethernet)**
  - Alimentam de forma elétrica equipamentos via cabo ETHERNET, como câmeras IP e Acces points.

- ---
- <h1 align="center" style="color:purple">Cabos e conectores de Rede</h1>
- <h3>RJ45</h3>
	- É o **conector** padrão utilizado em cabos de par trançado para redes Ethernet.
- <h3>Cabo de Par Trançado (UTP) - Ethernet</h3>
	- Alimenta eletricamente e transporta dados para equipamentos via cabo Ethernet, como câmera IP e acces points
	- Possui várias categorias
	  collapsed:: true
		- Variando de categorias mais **simples** até as mais **complexas**
	- Velocidades aceitas
	  collapsed:: true
		- 10 Mbps
		- 100 Mbps
		- 1000 Mbps
		- 10000 Mbps
	- STP -> Cabo de par trançado com uma blindagem a mais
	- IEEE -> 802.3 -> Código do cabo
	- Cada dispositivo tem uma placa de rede que especifica qual o tipo de conexão Ethernet pode ser estabelecida, ou seja, um dispositivo com uma porta FastEthernet só pode se conectar a outra porta FastEthernet, e assim por diante.
- <h3>Patch Cord</h3>
	- Cabo de par transado com conectores RJ45 nas duas pontas, utilizado para conectar dispositivos iguais, como roteadores e computadores
- <h3>Cabo Coaxial</h3>
	- Utilizado em redes mais antigas e TV a cabo. Tem bom isolamento contra interferência, mas é mais grosso e mais rígido que um cabo comum
		- Utilizado na topologia de Barramento
		- É simples
		- Sofre interferência eletromagnética -> Por ser feito de cobre
- <h3>Cabo de fibra óptica</h3>
	- Transmite dados via pulsos de lux.
	- Maior capacidades de transmissão de dados (velocidades) - até Tb/s
	- Possui uma altíssima velocidade e imune a interferências eletromagnéticas.
	- Não sofre interferências eletromagntéticas
	- Utilizado nas interconexões mundiais
	- mono-modo (longa distâncias)
	- multi-modo (curta distância)
- <h3>Cabo Cross-over</h3>
	- Um tipo de cabo especial que conecta dois dispositivos semelhantes
	- Esse cabo é como um de par trançado, mas cada ponta tem um padrão de trança diferente, sendo em uma ponta o **568A** e na outra o **568B**.
	- Utilizado somente quando é necessário conectar dispositivos **SEMELHANTES**, como dois computadores.
- <h3>Cabo Direto</h3>
	- Um cabo que contem os **conectores iguais**, ou seja, em ambas as pontas do cabo, o conector tem que ser o mesmo, seja seguindo o padrão **568A** ou **568B**.
	- Utilizado somente quando é necessário conectar dispositivos **DIFERENTES**, como um computador e uma impressora
- <h3>Cabo de Consola</h3>
	- Utilizado para configurar equipamentos via porta serial, como roteadores
- <h3>Conector LC/SC/ST</h3>
	- Conectores usados em cabos de fibra óptica.
		- SC quadrado
		- ST circular e com trava
		- LC menor e mais moderno
- <h3>Keystone Jack</h3>
	- Conector modular instalado em paredes e racks, onde os cabos são terminados para facilitar a conexão.
	-
- <h1 align="center" style="color:purple">Redes sem fio (Wireless)</h1>
- ### Fazem parte do meio Físico
- IRDA -> Infravermelho -> Muito simples -> Sofre com barreiras
- NFC -> Tecnologia de aproximação
- BLUETOOTH -> Rede pessoas sem fio e de curto alcance (PAN)
- WI-FI -> Rede local sem fio (WLAN)
- WI-MAX -> Rede local de uma operadora -> Rede de uma operadora dentro de uma cidade (WAN)
- SATÉLITE -> 3G, 4G, 5G
- ---