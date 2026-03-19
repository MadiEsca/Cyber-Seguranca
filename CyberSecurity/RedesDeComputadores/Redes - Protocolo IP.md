- <h2 align="left">1. O que é o IP</h2>
  Um endereço de **protocolo de internet (IP)** é um número de identificação exclusivo atribuído a cada dispositivo conectado à internet. Podemos defini-lo como um rótulo numérico atribuído a dispositivos que usam a internet para se comunicar. Computadores que se comunicam pela **internet** ou por meio de **redes locais** compartilham informações de um local específico para outro por meio do endereço IP.
  **Os endereços IP têm duas versões ou padrões distintos**:
	- ### 1.1.1 IPV4
	  O endereço do **protocolo de internet versão 4 (IPv4)** é o mais antigo dos dois, que tem espaço para até 4 bilhões de endereços IP e é atribuído a todos os computadores. 
	  O IPv4 é a quarta versão do IP. É um dos principais protocolos dos métodos baseados em padrões usados para interconectar a internet e outras redes. O protocolo foi implantado pela primeira vez na Atlantic Packet Satellite Network (SATNET), que era uma rede de satélites que formou um segmento dos estágios iniciais da internet, em 1982. Ele ainda é usado para rotear a maior
	  parte do tráfego da internet, apesar da existência do IPv6. O IPv4 está atualmente atribuído a todos os computadores. Um endereço IPv4 usa números binários de 32 bits para formar um endereço IP exclusivo. Ele pega o formato de quatro conjuntos de números, cada um dos quais varia de 0 a 255 e representa um número binário de oito dígitos, separado por um ponto.
	- ### 1.1.2 IPV6
	  **O Protocolo de Internet versão 6 (IPv6)** mais recente tem espaço para trilhões de endereços IP, que representam a nova geração de dispositivos, além de computadores. Há também vários tipos de endereços IP, incluindo endereços IP **públicos**, **privados**, **estáticos** e **dinâmicos**. Cada dispositivo com uma conexão de internet tem um endereço IP, seja um **computador**, **laptop**, **dispositivo IoT** ou até mesmo **brinquedos**.  Os endereços IP permitem a transferência eficiente de dados entre dois dispositivos conectados, permitindo que máquinas em redes diferentes conversem entre si.
	- ### 1.2 Como funciona um endereço IP?
	  O endereço IP funciona atribuindo um **endereço de rede** a qualquer dispositivo que **esteja conectado a uma rede**.
		- Um endereço IP pode revelar algumas coisas interessantes, como:
			- **Identificação de um host** 
			  collapsed:: true
				- A partir de determinado IP é possível **identificar um dispositivo dentro de uma rede**, sendo ela a internet ou uma rede local
				- Exemplo:
				  collapsed:: true
					- 192.168.1.**23**/24 -> É o **23°** dispositivo da rede local **192.168.2.0**
					  id:: 68bdcad5-c942-452c-8cab-f1642e52ddf9
			- **Identificação de uma rede**
			  collapsed:: true
				- Da mesma forma que é possível identificar um **dispositivo** dentro de uma rede, através do IP, também é possível **identificar uma rede**
				- Exemplo:
				  collapsed:: true
					- 10.10.8.**23**/24 -> É o **23°** dispositivo da rede **10.10.8.0**
			- **Identificação da localização de um dispositivo**
			  collapsed:: true
				- Um endereço IP não é aleatório, já que a criação de um endereço IP tem a base da matemática.
				- A Autoridade de Números Atribuídos à Internet (Internet Assigned Numbers Authority, IANA) aloca o endereço IP e sua criação.
				- A gama completa de endereços **IPV4** pode ir de **0.0.0.0 a 255.255.255.255**.
- ## Tipos de Endereço IP
	- ### Endereço IP público
		- O endereço de IP público, ou endereço *voltado para fora*, é o IP do **principal dispositivo** utilizado para nos conectarmos a internet comercial, ou doméstico do seu **provedor de serviços de internet** (ISP)
		- Na maioria dos casos, esse será o **roteador**. **Todos os dispositivos** que se conectam a um roteador se comunicam com outros dispositivos utilizando o **endereço IP do roteador**. Conhecer um endereço IP externo é **crucial** para que as pessoas **abram portas** usadas para **jogos on-line**, e**-mail**, **servidores web**, **streaming de mídia** e **criação de conexões remotas**.
	- ### Endereço IP privado
		- Um endereço IP privado, ou endereço IP *voltado para dentro*, é atribuído por um escritório ou intranet doméstica (rede interna) a dispositivos conectados nela, ou pelo **provedor de serviços de internet** (**ISP**). O roteador de casa/escritório gerencia os endereços IP privados para os dispositivos que se conectam a ele dentro dessa rede local.
		- Os dispositivos de rede são, portanto, mapeados de seus endereços IP privados para endereços IP públicos pelo roteador. Os **endereços IP privados são reutilizados em várias redes**, preservando assim o valioso espaço de endereço IPv4 e estendendo a capacidade de endereço além do limite simples do endereço IPv4 (4.294.967.296 ou 2^32).
		- No esquema de endereçamento IPv6, cada dispositivo tem seu **próprio identificador exclusivo** atribuído pelo **ISP** ou pela **organização de rede primária**, que tem um prefixo exclusivo. O endereçamento privado também é possível no IPv6 e, quando usado, é chamado de **endereçamento local exclusivo** (**ULA**).
- ## Estático X Dinâmico
- ### Endereço IP estático
	- Todos os endereços públicos e privados são definidos como **estáticos** ou **dinâmicos**.
	- Um endereço IP que uma pessoa configura e corrige manualmente na rede de seu dispositivo é chamado de endereço IP estático. Um endereço IP estático não pode ser alterado automaticamente. Um provedor de serviços de internet pode atribuir um endereço IP estático a uma conta de usuário. O mesmo endereço IP será atribuído a esse usuário para cada sessão.
- ### Endereço IP dinâmico
	- Um endereço IP dinâmico é atribuído automaticamente a uma rede quando um roteador é  configurado. O Protocolo de configuração dinâmica de host (DHCP) atribui a distribuição desse conjunto dinâmico de endereços IP. O DHCP pode ser o roteador que fornece endereços IP para redes em uma casa ou organização. Cada vez que um usuário faz login na rede, um endereço IP novo é atribuído a partir do grupo de endereços IP disponíveis (atualmente não atribuídos). Um
	  usuário pode passar aleatoriamente por vários endereços IP em várias sessões.
- # O que é IPv4?
	- O IPv4 é a quarta versão do IP. É um dos principais protocolos dos métodos baseados em padrões usados para interconectar a internet e outras redes. O protocolo foi implantado pela primeira vez na Atlantic Packet Satellite Network (SATNET), que era uma rede de satélites que formou um segmento dos estágios iniciais da internet, em 1982. Ele ainda é usado para rotear a maior
	  parte do tráfego da internet, apesar da existência do IPv6. O IPv4 está atualmente atribuído a todos os computadores. Um endereço IPv4 usa números binários de 32 bits para formar um endereço IP exclusivo. Ele pega o formato de quatro conjuntos de números, cada um dos quais varia de 0 a 255 e representa um número binário de oito dígitos, separado por um ponto.
- # Classes de endereço IP
  ---
  Alguns endereços IP são reservados pela autoridade de números atribuídos à internet (Internet Assigned Numbers Authority, IANA). Eles são normalmente reservados para redes que têm uma finalidade específica noProtocolo de controle de transmissão/Protocolo de internet (Transmission Control Protocol/Internet Protocol, TCP/IP), que é usado para interconectar dispositivos. 
  
  Quatro dessas classes de endereço IP incluem:
  1. 0.0.0.0: Esse endereço IP no IPv4 também é conhecido como rede padrão. É o endereço meta não roteável que designa um destino de rede inválido, não aplicável ou desconhecido.
  2. 127.0.0.1: Esse endereço IP é conhecido como o endereço de loopback, que um computador usa para se identificar, independentemente de ter recebido ou não um endereço IP.
  3. 169.254.0.1 a 169.254.254.254: Uma série de endereços que são atribuídos automaticamente se um computador não for bem-sucedido na tentativa de receber um endereço do DHCP.
  4. 255.255.255.255: Um endereço dedicado a mensagens que precisam ser enviadas para todos os computadores em uma rede ou transmitidas em uma rede.
  
  Outros endereços IP reservados são para o que é conhecido como classes de sub-rede. As sub- redes são pequenas redes de computadores que se conectam a uma rede maior por meio de um roteador. A sub-rede pode receber seu próprio sistema de endereço IP, de modo que todos os dispositivos que se conectam a ela possam se comunicar entre si sem ter que enviar dados através da rede mais ampla. O roteador em uma rede TCP/IP pode ser configurado para garantir que reconheça sub-redes e, em seguida, roteie o tráfego para a rede apropriada. Os endereços IP são reservados para as seguintes sub-redes:
  
  1. Classe A: Endereços IP entre 10.0.0.0 e 10.255.255.255
  2. Classe B: Endereços IP entre 172.16.0.0 e 172.31.255.255
  3. Classe C: Endereços IP entre 192.186.0.0 e 192.168.255.255
  4. Classe D ou multicast: Endereços IP entre 224.0.0.0 e 239.255.255.255
  5. Classe E, reservada para uso experimental: Endereços IP entre 240.0.0.0 e 254.255.255.254
  
  Observação:
- Endereços que terminam em 0 são endereços de rede.
- Endereços que terminam em 255 são endereços de broadcast.
  
  Os endereços IP listados nas Classes A, B e C são mais comumente usados na criação de sub-redes. Os endereços dentro do multicast ou Classe D têm regras de uso específicas descritas nas diretrizes da Internet Engineering Task Force (IETF) enquanto o lançamento de endereços de Classe E para uso público foi a causa de muitos debates antes da introdução do padrão IPv6.
- # Endereços e sub-redes de internet
  ---
  A IANA reserva blocos de endereço IP específicos para organizações
  comerciais, departamentos governamentais e ISPs. Quando um usuário se
  conecta à internet, seu ISP atribui a ele um endereço de dentro de um dos
  blocos atribuídos a ele. Se eles ficarem on-line apenas a partir de um
  computador, então podem usar o endereço atribuído a ele pelo ISP. 
  No entanto, a maioria das casas agora usa roteadores que compartilham uma
  conexão de rede com vários dispositivos. Portanto, se um roteador for usado
  para compartilhar a conexão, o ISP atribuirá o endereço IP ao roteador e, em
  seguida, uma sub-rede será criada para todos os computadores que se
  conectam a ele. 
  Os endereços IP que se enquadram em uma sub-rede têm uma rede e um nó.
  A sub-rede é identificada pela rede. O nó, também conhecido como host, se
  conecta à rede e precisa de seu próprio endereço. Os computadores separam
  a rede e o nó por meio de uma máscara de sub-rede, que filtra a designação de
  endereço IP apropriada. Quando uma grande rede é configurada, a máscara de
  sub-rede que melhor se adapta ao número de nós ou sub-redes necessários é
  determinada. 
  Quando se trata de endereços IP dentro de uma sub-rede, o primeiro endereço
  é reservado para a sub-rede e o último indica o endereço de transmissão para
  os sistemas da sub-rede.
  
  IPv4 vs. IPv6
  O IPv4 não conseguiu lidar com a enorme explosão na quantidade e variedade
  de dispositivos além de simplesmente telefones celulares, computadores
  desktop e laptops. O formato original do endereço IP não conseguiu lidar com o
  número de endereços IP que estão sendo criados.
  Para resolver esse problema, o IPv6 foi introduzido. Esse novo padrão opera
  um formato hexadecimal que significa que bilhões de endereços IP exclusivos
  agora podem ser criados. Como resultado, o sistema IPv4 que poderia suportar
  até cerca de 4,3 bilhões de números exclusivos foi substituído por uma
  alternativa que, teoricamente, oferece endereços IP ilimitados.
  Isso ocorre porque um endereço IP IPv6 consiste em oito grupos que contêm
  quatro dígitos hexadecimais, que usam 16 símbolos distintos de 0 a 9 seguidos
  de A a F para representar valores de 10 a 15.
  
  Como faço para localizar meu endereço IP?
  Os usuários de computadores Windows podem pesquisar seu endereço IP
  digitando “cmd” na guia de pesquisa e pressionando Enter, em seguida,
  digitando “ipconfig” na caixa pop-up. Os usuários de computadores Mac podem
  encontrar seu endereço IP acessando Preferências do sistema e selecionando
  Rede. 
  Para procurar um endereço IP em um telefone celular, os usuários precisam
  acessar Configurações e abrir o menu Wi-Fi e seu menu de rede. O endereço
  IP deve ser listado na seção Avançado, dependendo do telefone que ele usar.
  
  Endereço IP vs. endereço MAC
  Ao analisar um endereço IP vs. um endereço MAC, você pode começar com as
  semelhanças. Para ambos os tipos de endereço IP, você está lidando com um
  identificador exclusivo com um anexo a esse dispositivo. O fabricante de uma
  placa de rede ou roteador é o provedor do endereço MAC, enquanto o
  provedor de serviços de internet (ISP) é o provedor do endereço IP.
  A principal diferença entre os dois é que o endereço MAC é o endereço físico
  de um dispositivo. Se você tiver cinco laptops em sua rede Wi-Fi doméstica,
  você pode identificar cada um desses cinco laptops em sua rede por meio do
  endereço MAC deles.  
  O endereço IP funciona de forma diferente, pois é o identificador da conexão
  da rede com esse dispositivo. Outras diferenças incluem:
   Um endereço MAC é um endereço hexadecimal de 6 bytes, enquanto
  um endereço IP é um endereço de 4 ou 16 bytes.
   Um endereço MAC está em uma camada de link de dados, enquanto um
  endereço IP está em uma camada de rede.
   Um terceiro terá dificuldade para encontrar um endereço MAC, enquanto
  pode encontrar facilmente um endereço IP.
   Os endereços MAC são estáticos, enquanto os endereços IP podem
  mudar dinamicamente 
   Endereços MAC e endereços IP são necessários para obter um pacote
  de rede para um destino.  No entanto, ninguém pode ver seu endereço
  MAC a menos que ele esteja em sua LAN
  
  Resumo das diferenças: IPv4 em comparação com IPv6
  IPv4 IPv6
  O que é isso? Protocolo de Internet Protocolo de Internet versão seis
  
  versão quatro
  
  Tamanho do
  endereço
  
  32 bits ou
  2 32  endereços IP 128 bits ou 2 128  endereços IP
  
  Padrão de
  nomenclatura
  
  Endereço IP numérico.
  Quatro lotes de
  números de três
  dígitos, separados por
  pontos finais.
  197.0.0.1
  
  Endereço alfanumérico. Oito lotes
  de números hexadecimais de
  quatro caracteres, separados por
  dois pontos.
  2600:1400:d:5a3::3bd4
  
  Endereço de
  loopback 127.0.0.1 ::1
  
  Requer tradução
  de endereço
  
  Sim, por meio da
  conversão de
  endereços de rede
  (NAT)
  
  Não
  
  Endereçamento
  de pacotes
  
  Unicast, broadcast e
  multicast Unicast, multicast e anycast
  
  Configuração de
  endereço
  
  Configuração manual
  e DHCP
  
  Configuração automática no
  dispositivo usando a configuração
  automática de endereço sem
  estado (SLAAC). O DHCPv6
  também é suportado para
  conexões com estado.
  
  Tamanho do
  cabeçalho
  
  Variável; 20 bytes, que
  pode aumentar até 60
  bytes quando campos
  e sinalizadores
  opcionais são
  adicionados
  
  Fixo; 40 bytes. O tamanho dos
  cabeçalhos de extensão separados
  varia.
  
  Soma de
  verificação do
  cabeçalho
  
  Sim Não
  
  Extras opcionais Suporte limitado para
  controles opcionais
  
  Vários cabeçalhos de extensão
  estão disponíveis para aprimorar o
  roteamento, a fragmentação, a
  qualidade do serviço e assim por
  diante
  
  Privacidade Mascaramento de Extensões de privacidade IP que
  
  endereço IP para
  ocultar os últimos oito
  bits de um endereço
  
  usam endereços temporários
  aleatórios
  
  Fragmentação Gerenciado por
  
  roteadores Gerenciado pelo originador
  
  Resolução de
  DNS Um registro Registros AAAA
  Eficiência de
  roteamento
  
  Manipulado em
  cabeçalhos
  
  Manipulado em tabelas de
  roteamento
  Suporte móvel Requer IP móvel Embutido
  
  Quais são as ameaças de segurança relacionadas aos
  endereços IP?
  Uma variedade de ameaças de segurança está relacionada a endereços IP. Os
  cibercriminosos podem enganar dispositivos para revelar seu endereço IP e
  fingir que são você ou persegui-los para rastrear a atividade e aproveitar. A
  busca on-line e a engenharia social são as duas principais ameaças de
  segurança existentes para endereços IP.  
  Algumas das outras ameaças de segurança a um endereço IP incluem:
  1. Permitir que um cibercriminoso use seu endereço IP para rastrear sua
  localização
  2.  Usar seu endereço IP para direcionar sua rede e iniciar um ataque
  DDoS
  3. Usar seu endereço IP para fazer download de conteúdo ilegal
  
  5 maneiras de proteger seu endereço IP
  Há várias maneiras de proteger seu endereço IP contra cibercriminosos.
  Algumas dessas opções incluem:
  1. Usar uma VPN
  2. Usar um servidor proxy
  3. Faça com que seu ISP use endereços IP dinâmicos
  4. Empregue um firewall NAT para ocultar seu endereço IP privado
  5. Redefinir seu modem pode alterar seu endereço IP