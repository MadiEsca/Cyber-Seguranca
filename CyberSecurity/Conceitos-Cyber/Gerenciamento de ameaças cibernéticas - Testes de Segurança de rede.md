# Network Security
collapsed:: true
	- ## Resumo
	  collapsed:: true
		- Diante da necessidade que temos de **verificar e analisar a segurança de nossa rede**, surgiram diversas ferramentas que nos auxiliam nesse processo, muitas vezes automatizando-os. Dentre eles, se destacam uma certa classe ferramental, os chamados **scanners**.
		- Esses **scanners** acessam **computadores**, **sistemas** e **redes** em busca de falhas ou vulnerabilidades
		- > A vulnerability scanner looks for the following types of vulnerabilities:
		  Use of default passwords or common passwords
		  Missing patches
		  Open ports
		  Misconfigurations in operating systems and software
		  Active IP addresses, including any unexpected devices connected
	- ## Tipos de Scanner
	  collapsed:: true
		- ## Categorias de Scans
			- **Network scanners** probe hosts for open ports, enumerate information about users and groups and look for known vulnerabilities on the network.
			- **Application scanners** access application source code to test an application from the inside (they do not run the application).
			- **Web application scanners** identify vulnerabilities in web applications.
	- ## Tipos de testes de rede
	  collapsed:: true
		- Depois que uma rede estiver operacional, você deve acessar seu status de segurança. Muitos testes de segurança podem ser realizados para avaliar o status operacional da rede:
			- **Penetration testing** - Testes de penetração de rede, ou testes de penetração, simulam ataques de fontes maliciosas. O objetivo é determinar a viabilidade de um ataque e as possíveis consequências se um ocorrer. Alguns testes de penetração podem envolver o acesso às instalações de um cliente e o uso de habilidades de engenharia social para testar sua postura geral de segurança.
			- **Network scanning** - inclui software que pode fazer ping em computadores, verificar portas TCP de escuta e exibir quais tipos de recursos estão disponíveis na rede. Alguns softwares de varredura também podem detectar nomes de usuários, grupos e recursos compartilhados. Os administradores de rede podem usar essas informações para fortalecer suas redes.
			- **Vulnerability scanning** - Inclui software que pode detectar fraquezas potenciais nos sistemas testados. Esses pontos fracos podem incluir configuração incorreta, senhas em branco ou padrão ou alvos potenciais para ataques DoS. Alguns softwares permitem que os administradores tentem travar o sistema através da vulnerabilidade identificada.
			- **Password cracking** - Isso inclui software usado para testar e detectar senhas fracas que devem ser alteradas. As políticas de senha devem incluir diretrizes para evitar senhas fracas.
			- **Log review** - os administradores de sistema devem revisar os logs de segurança para identificar ameaças de segurança em potencial. O software de filtragem para varrer arquivos de log longos deve ser usado para ajudar a descobrir atividades anormais a serem investigadas.
			- **Integrity checkers** -um sistema de verificação de integridade detecta e relatórios sobre mudanças no sistema. A maior parte do monitoramento concentra-se no sistema de arquivos. No entanto, alguns sistemas de verificação podem relatar atividades de login e logout.
			- **Virus detection** - O software de detecção de vírus ou antimalware deve ser usado para identificar e remover vírus de computador e outros malwares.
			  
			  **Nota**: Outros testes, incluindo Wardialing e Witders, são considerados legados, mas ainda devem ser contabilizados em testes de rede.
	- ## Ferramentas de diagnóstico de redes - CLI
	  collapsed:: true
		- ## **ipconfig**
		  collapsed:: true
			- exibe as configurações de TCP / IP (endereço IP, máscara de sub-rede, gateway padrão, informações de DNS e MAC (ifconfig é o equivalente em Mac / Linux).
		- ## **ping**
		  collapsed:: true
			- testa a conectividade de rede enviando uma solicitação de ICMP para um host e determina se uma rota está disponível para um host.
		- ## **arp**
		  collapsed:: true
			- fornece uma tabela que mapeia endereços MAC conhecidos para o endereço IP associado e é uma maneira rápida de encontrar o endereço MAC de um dispositivo final.
		- ## **tracert**
		  collapsed:: true
			- rastreia a rota que um pacote leva até um destino e registra os saltos ao longo do caminho, ajudando a localizar onde um pacote está sendo desligado (**traceroute** é o equivalente em Mac / Linux).
		- ## **nslookup**
		  collapsed:: true
			- consulta um servidor DNS para ajudar a solucionar um banco de dados DNS (dig é o equivalente em Mac /Linux).
		- ## **netstat**
		  collapsed:: true
			- exibe todas as portas que um computador está ouvindo e pode determinar as conexões ativas.
		- **nbtstat** ajuda a solucionar problemas de resolução de nomes do NetBIOS em um sistema Windows.
		- **nmap** é usado na auditoria de segurança. Ele localiza hosts de rede, detecta sistemas operacionais e identifica serviços.
		  collapsed:: true
			- **nmap** é um scanner de baixo nível comumente usado que está disponível para o público. Possui uma variedade de excelentes recursos que podem ser usados para mapeamento de rede e reconhecimento.
				- A funcionalidade básica do Nmap permite ao usuário realizar várias tarefas, sendo elas:
					- **Clássico TCP e UDP Port Scanning** - isso procura por diferentes serviços em um host.
					- **Clássico TCP e UDP Port Sweeping** - Isto procura o mesmo serviço em vários hosts.
					- **Varreduras furtivas de portas TCP e UDP **- Semelhante às varreduras clássicas, mas mais difíceis de detectar pelo host de destino ou IPS.
					- **Identificação do sistema operacional remoto **- isso também é conhecido como OS Fingerprint.
					  
					  As características avançadas do Nmap incluem a varredura de protocolo, conhecida como varredura de porta da camada 3. Este recurso identifica o suporte ao protocolo da Camada 3 em um host. Exemplos de protocolos que podem ser identificados incluem GRE e OSPF.
					  
					  Embora o Nmap possa ser usado para testes de segurança, ele também pode ser usado para fins maliciosos. O Nmap tem um recurso adicional que permite usar hosts falsos na mesma LAN do host de destino, para mascarar a origem da varredura.
					  
					  O Nmap não possui recursos de camada de aplicativo e é executado em UNIX, Linux, Windows e OS X. As versões de console e gráfica estão disponíveis. O programa Nmap e Zenmap GUI podem ser baixados da internet.
		- **netcat** coleta informações de conexões de rede TCP e UDP e pode ser usado para varredura de portas, monitoramento, captura de banner e cópia de arquivos.
		- **hping** monta e analisa pacotes e é usada para varredura de portas, descoberta de caminho, impressão digital do SO e testes de firewall.
		- **SuperScan**- Este software de varredura de porta é projetado para detectar as portas Abrir TCP e UDP, determine quais serviços estão sendo executados nessas portas e execute consultas, como pesquisas Whois, Ping, Traceroute e HostName.
		  collapsed:: true
			- **SuperScan** é uma ferramenta de Scanning de portas do Windows. Ele é executado na maioria das versões do Windows e requer privilégios de administrador.
				- A versão 4 do superScan tem uma série de recursos úteis:
					- Velocidade de digitalização ajustável
					- Suporte para intervalos de IP ilimitados
					- Detecção de host aprimorada usando vários métodos ICMP
					- Digitalização TCP SYN
					- Varredura UDP (dois métodos)
					- Geração de relatórios HTML simples
					- Verificação da porta de origem
					- Resolução rápida de nome de host
					- Extensas capacidades de agarrar banner
					- Banco de dados maciço incorporado da descrição da
					- Randomização de ordem de varredura de IP e porta
					- Uma seleção de ferramentas úteis, como ping, traceroute e whois
					- Amplo recurso de enumeração de host do Windows
				- Ferramentas, como Nmap e SuperScan, podem fornecer testes de penetração eficazes em uma rede e determinar vulnerabilidades de rede, ajudando a antecipar possíveis mecanismos de ataque. No entanto, o teste de rede não pode preparar um administrador de rede para todos os problemas de segurança.
		- **Siem (gerenciamento de eventos de informação de segurança)** - Esta é uma tecnologia usada em organizações corporativas para fornecer relatórios em tempo real e análise de longo prazo de eventos de segurança.
		  collapsed:: true
			- O SIEM (Security Information Event Management) é uma tecnologia usada em organizações empresariais para fornecer relatórios em tempo real e análise de longo prazo de eventos de segurança. O SIEM evoluiu de dois produtos anteriormente separados: Security Information Management (SIM) e Security Event Management (SEM). O SIEM pode ser implementado como software, integrado ao Cisco Identity Services Engine (ISE) ou como um serviço gerenciado.
			- SIEM combina as funções essenciais de SIM e SEM para fornecer:
			  collapsed:: true
				- **Correlação** - Examina logs e eventos de sistemas ou aplicativos diferentes, acelerando a detecção e reação às ameaças de segurança.
				- **Agregação** - A agregação reduz o volume de dados de eventos consolidando registros de eventos duplicados.
				- **Análise Forense** - A capacidade de pesquisar logs e registros de eventos de fontes em toda a organização fornece informações mais completas para análise forense.
				- **Retenção** - O relatório apresenta os dados de eventos correlacionados e agregados em monitoramento em tempo real e resumos de longo prazo.
			- Siem fornece detalhes sobre a fonte de atividade suspeita, incluindo:
			  collapsed:: true
				- Informações do usuário (nome, status de autenticação, local, grupo de autorização, status de quarentena)
				- Informações do dispositivo (fabricante, modelo, versão do sistema operacional, endereço MAC, método de conexão de rede, localização)
				- Informações de postura (conformidade do dispositivo com a política de segurança corporativa, versão antivírus, patches do sistema operacional, conformidade com a política de gerenciamento de dispositivos móveis)
				  
				  Usando essas informações, os engenheiros de segurança de rede podem avaliar rapidamente e precisar avaliar a importância de qualquer evento de segurança e responder às perguntas críticas:
					- Quem está associado a este evento?
					- É um usuário importante com acesso à propriedade intelectual ou informações confidenciais?
					- O usuário está autorizado a acessar esse recurso?
					- O usuário tem acesso a outros recursos confidenciais?
					- Que tipo de dispositivo está sendo usado?
					- Esse evento representa um problema de conformidade em potencial?
		- **GFI LANguard** - Este é um scanner de rede e segurança que detecta vulnerabilidades.
		- **TripWire**- Esta ferramenta avalia e valida configurações de TI contra políticas internas, padrões de conformidade e as melhores práticas de segurança.
		- **Nessus **- Este é um software de varredura de vulnerabilidade, com foco em acesso remoto, miscigurações e DOS contra a pilha TCP / IP.
		- **L0phtCrack**- Este é um aplicativo de auditoria e recuperação de senha.
		- **Metasploit**- Esta ferramenta fornece informações sobre vulnerabilidades e ajuda em testes de penetração e desenvolvimento de assinaturas de IDs.
	- ## Aplicando Resultados de Teste de Rede
	  collapsed:: true
		- Os resultados dos testes de segurança de rede podem ser usados de várias maneiras:
			- Para definir atividades de mitigação para abordar vulnerabilidades identificadas
			- Como referência para rastrear o progresso de uma organização em atender aos requisitos de segurança
			- Avaliar o estado de implementação dos requisitos de segurança do sistema
			- Realizar análises de custos e benefícios para melhorias na segurança da rede
			- Melhorar outras atividades, como avaliações de risco, certificação e autorização (C&A) e esforços de melhoria de desempenho
			- Como ponto de referência para a ação corretiva
- # Pentesting
	- ## Resumo
	  collapsed:: true
		- O teste de penetração (pen testing) é um método de testar áreas de fraquezas em sistemas usando várias técnicas maliciosas. Um teste de penetração simula os métodos que um invasor usaria para obter acesso não autorizado a uma rede, atacando os sistemas da empresa, permitindo que essa empresa entenda como funciona um ataque real, fazendo com que eles entendam a gravidade do ataque e possam se prevenir.
		- É importante observar que o pentesting não é o mesmo que **teste de vulnerabilidade**, que apenas *identifica* possíveis problemas. O ***pentesting*** envolve invadir um site, rede ou servidor (com a permissão de uma empresa) para tentar obter acesso não autorizados a recursos da empresa, utilizando vários métodos que os invasores da vida real usariam.
		- Um dos principais motivos que uma empresa tem para contratar um *pentester* é para encontrar e corrigir as vulnerabilidades presentes no sistema, rede ou servidor da empresa, antes que cyber criminosos tirem proveito desses defeitos. O pentesting também é uma das técnicas utilizadas no Ethical Hacking
	- ## Tipos de Pentesting
	  collapsed:: true
		- **Teste de Caixa Preta (Black Box)** é o menos demorado e o mais barato. Nesse tipo de teste, o especialista não tem conhecimento sobre o funcionamento interno do sistema e tenta atacá-lo a partir da perspectiva de um usuário comum.
		- **Teste de Caixa Cinza (Gray Box)** é uma combinação entre o teste de caixa preta e o de caixa branca. O especialista possui algum conhecimento limitado sobre o sistema, criando um ambiente parcialmente conhecido, o que dá certa vantagem às tentativas de invasão.
		- **Teste de Caixa Branca (White Box)** é o mais demorado e o mais caro, pois é realizado por um especialista que tem conhecimento completo de como o sistema funciona. Esse modelo simula um ambiente conhecido, como quando o ataque parte de alguém de dentro da organização ou de um invasor que já conseguiu obter informações detalhadas na fase de reconhecimento.
	- ## Fases de um Pentest
	  collapsed:: true
		- **Planejamento** - Estabelece regras de negócio para a realização do teste
		  logseq.order-list-type:: number
		- **Descoberta** - Etapa onde é feito o reconhecimento do alvo
		  logseq.order-list-type:: number
		  collapsed:: true
			- Reconhecimento Passivo - Que não exigem contato direto com o alvo, seja ele um sistema, rede ou servidor. Também conhecidos como *footprint*, por exemplo, é possível consultar o site da empresa ou qualquer outra fonte pública para conseguir informações a respeito do alvo(OSINT)
			  logseq.order-list-type:: number
			- Reconhecimento Ativo - Etapa onde é o reconhecimento é feito tendo contato direto com o alvo, como por exemplo, um *Port Scanning*
			  logseq.order-list-type:: number
		- **Ataque** - Etapa onde buscamos acesso aos dados do alvo
		  logseq.order-list-type:: number
		  collapsed:: true
			- Nessa fase, busca-se acessar ou invadir o sistema, muitas vezes se utilizando das informações coletadas na etapa anterior. O testador tenta obter privilégios elevados e, possivelmente, explorar mais a fundo a rede por meio de *movimentos laterais*. Para se mover lateralmente dentro da rede, o invasor passará por múltiplos sistemas. Ele pode tentar instalar ferramentas adicionais ou implantar um backdoor dentro do sistema — processo conhecido como *persistência*. Depois disso, o invasor faz a limpeza do sistema, removendo qualquer rastro que tenha sido deixado para trás.
			  logseq.order-list-type:: number
		- **Geração de Relatórios** - Etapa de entrega da documentação referente as vulnerabilidades que foram reportadas após a invasão, sugerindo ações para corrigir esses erros
		  logseq.order-list-type:: number
	- ## Exercícios entre equipes
	  collapsed:: true
		- Algumas empresas criam **times competitivos** que representam cada etapa e função em uma auditoria de segurança. Com isso, é possível treinar separadamente e, consequentemente, melhorar os pontos fortes de cada uma dessas áreas, que são:
		  collapsed:: true
			- **Red-Team**
			  collapsed:: true
				- Time focada na invasão e nos ataques aos alvos, onde realizam ataquem ao alvo com o objetivo de não serem detectados
			- **Blue-Team**
			  collapsed:: true
				- Time focado na defesa, busca defender o sistema dos atacantes, identificando os ataques que ocorreram, ou estão ocorrendo, a fim de solucionar o ataque.
			- **Purple-Team**
			  collapsed:: true
				- É a mescla dos dois times, onde ambos se juntam a fim de melhorar determinado sistema
			- **White-Team**
			  collapsed:: true
				- É o time neutro, normalmente são os "moderadores" dos exercícios. O membros desse time são menos técnicos, mas dominam áreas como governança e conformidade digital.
	- ## Packet analyzers/packet sniffers
		- Esses Packet analyzers ou packet sniffers são programas que funcionam analisando e armazenando dados a respeito do tráfego da rede. Esses programas podem ser utilizados tanto para fins legítimos, como análise do tráfego dentro de uma rede corporativa, ou para fins ilegítimos, como para coletar e comprometer dados. Esses analisadores possuem as seguintes funções:
		  collapsed:: true
			- Análise de problemas de rede
			- Detecção de invasão de redes
			- Isolamento do sistema que está sendo explorado
			- Log de tráfego
			- Detecção de uso indevido da rede