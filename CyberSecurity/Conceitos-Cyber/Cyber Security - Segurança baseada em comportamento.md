- É uma forma de detecção de ameças que se baseia na captura e análise do fluxo de informações que são passadas entre um usuário da rede local e um destinatário, seja ele local ou remoto. Qualquer alteração ou sinal que fuja dos padrões comuns, são tidos como anomalias, e podem significar que a ocorrência de um ataque
- ---
- **Honeypot**
	- Um tipo de **Behavior-based** detection que engana os atacantes simulando falhas comuns de serem exploradas dentro do sistema, com isso, os atacantes que invadem esses *Honeypots* caem em uma suposta falha, que permite com que os administradores de rede possam capturar, armazenar e analisar o comportamento desses atacantes afim de construir e melhorar seus sistemas de segurança contra possíveis novos ataques.
-
- <h2>Netflow</h2>
- É uma tecnologia utilizada para capturar informações sobre os dados que estão fluindo dentro da rede.
  collapsed:: true
	- Quem está enviando informações
	- Quais dispositivos estão na rede
- Além disso, é um importante ferramenta quando o assunto é a detecção e análise de segurança baseada no comportamento da rede e de quem está utilizando-a
- Utilizada para a construção de **bases comportamentais**, podendo coletar até 90 atributos, como o IP da fonte e o IP de destino desse fluxo.
-
- <h2>Pentesting</h2>
- **Etapas de um Pentest**
	- Planejamento
	  logseq.order-list-type:: number
	  collapsed:: true
		- Etapa onde o Pentester busca o máximo de informações sobre o sistema ou rede do alvo
		  logseq.order-list-type:: number
			- Possíveis Exploits
			  logseq.order-list-type:: number
			- Vulnerabilidades
			  logseq.order-list-type:: number
		- Isso envolve o reconhecimento passivo ou ativo (footprints) e uma análise e pesquisa de vulnerabilidades
		  logseq.order-list-type:: number
	- Varredura
	  logseq.order-list-type:: number
	  collapsed:: true
		- Etapa onde o Pentester se encarrega de realizar uma varredura dentro dessa rede ou sistema em busca de potenciais falhas, que caso exploradas, possam fornecer acesso a atacante.
		  logseq.order-list-type:: number
			- Varredura de portas
			  logseq.order-list-type:: number
				- Identificar serviços em execução
				  logseq.order-list-type:: number
				- Identificar portas abertas
				  logseq.order-list-type:: number
				- Identificar possíveis formas de se entrar dentro do sistema ou rede
				  logseq.order-list-type:: number
			- Busca de vulnerabilidades
			  logseq.order-list-type:: number
				- Para identificar formas exploits que possam ser explorados
				  logseq.order-list-type:: number
			- Estabelecer conexão com o alvo (ennumeration)
			  logseq.order-list-type:: number
				- Para identificar a conta de usuário padrão, usuário do sistema e conta de administrador
				  logseq.order-list-type:: number
	- Ganhando Acesso
	  logseq.order-list-type:: number
	  collapsed:: true
		- Etapa onde o Pentester utiliza métodos para conseguir acesso ao sistema ou a rede e fazer o *sniffing* no tráfego rede, alguns desses métodos incluem:
		  logseq.order-list-type:: number
			- Engenharia Social
			  logseq.order-list-type:: number
			- Explorar vulnerabilidades de um site
			  logseq.order-list-type:: number
			- Explorar vulnerabilidades de um software ou más configurações
			  logseq.order-list-type:: number
			- Burlar a controles de acesso
			  logseq.order-list-type:: number
			- Quebrar senhas de wi-fi mal configuradas
			  logseq.order-list-type:: number
	- Mantendo o Acesso
	  logseq.order-list-type:: number
	  collapsed:: true
		- O pen tester manterá o acesso ao alvo para descobrir quais dados e sistemas estão vulneráveis à exploração. É importante que não sejam detectados, normalmente usando backdoors, cavalos de Troia, rootkits e outros canais encobertos para ocultar sua presença.
		  logseq.order-list-type:: number
	- Analise e *report*
	  logseq.order-list-type:: number
	  collapsed:: true
		- O pen tester fornecerá feedback por meio de um relatório que recomenda atualizações de produtos, políticas e treinamento para melhorar a segurança de uma empresa.
		  logseq.order-list-type:: number
- <h2>Gerenciamento de Riscos</h2>
- **Identificar os Riscos**
  collapsed:: true
	- Identifique as ameaças que aumentam o risco. As ameaças podem incluir processos, produtos, ataques, possível falha ou interrupção de serviços, percepção negativa da reputação de uma empresa, possível responsabilidade legal ou perda de propriedade intelectual.
- **Classifique os Riscos**
  collapsed:: true
	- Determine a gravidade que cada ameaça representa. Por exemplo, algumas ameaças podem paralisar toda uma empresa, enquanto outras podem ser apenas pequenos inconvenientes. O risco pode ser priorizado ao avaliar o impacto financeiro (uma análise quantitativa) ou o impacto escalado na operação de uma organização (uma análise qualitativa).
- **Tratando o Risco**
  collapsed:: true
	- Desenvolver um plano de ação para reduzir a exposição geral aos riscos da empresa, detalhando onde os riscos podem ser eliminados, mitigados, transferidos ou aceitos.
- **Monitorando o Risco**
  collapsed:: true
	- Analise continuamente qualquer risco reduzido por meio de ações de eliminação, mitigação ou transferência. Lembre-se, nem todos os riscos podem ser eliminados, então você precisará monitorar atentamente todas as ameaças que foram aceitas.
-
- <h2>CSIRT- Computer Security Incident Response Team</h2>
- Muitas empresas de grande porte têm uma equipe de resposta a incidentes de segurança computacional (CSIRT-Computer Security Incident Response Team) para recepção, análise e resposta de incidentes de segurança de computador.
- Existem várias organizações CSIRT nacionais e públicas, como a Divisão CERT do Software Engineering Institute da Carnegie Mellon University, que estão disponíveis para ajudar as organizações e CSIRTs nacionais a desenvolver, operar e melhorar suas capacidades de gerenciamento de incidentes.
-
- <h2>Manual de Segurança</h2>
-
- Uma das melhores maneiras de se preparar para uma violação de segurança é evitá-la. As empresas devem fornecer orientação sobre:
  collapsed:: true
	- como identificar os riscos de segurança digital para sistemas, ativos, dados e recursos
	- a implementação de proteções e treinamento de pessoal
	- um plano de resposta flexível que minimiza o impacto e os danos em caso de violação de segurança
	- as medidas e os processos de segurança que precisam ser implementados após uma violação de segurança.
- Todas estas informações devem ser compiladas em um **manual de segurança**.
-
- <h2>O que é um Manual de Segurança</h2>
- Um manual de segurança é um conjunto de consultas ou relatórios que descrevem um processo padronizado de detecção e
  resposta a incidentes. Idealmente, um manual de segurança deve:
  · destacar como identificar e automatizar a resposta a ameaças comuns, como a detecção de máquinas infectadas por
  malware, atividade de rede suspeita ou tentativas de autenticação irregular.
  · descrever e definir claramente o tráfego de entrada e saída.
  · fornecer informações resumidas, incluindo tendências, estatísticas e contagens.
  · fornecer acesso utilizável e rápido às principais estatísticas e métricas.
  · correlacionar eventos em todas as fontes de dados relevantes.
-
- <h2>Ferramentas para prevenção e detecção de incidentes</h2>
- | **Ferramenta**|**Descrição**|
  |------------|----------|
  |**Security Information and Event Management**|Um sistema Security Information and Event Management (SIEM) coleta e analisa alertas de segurança, logs e outros dados históricos e em tempo real de dispositivos de segurança na rede para facilitar a detecção precoce de ataques cibernéticos.|
  |**Data Loss Prevention**|Um sistema de Data Loss Prevention (DLP) é projetado para impedir que dados confidenciais sejam roubados ou escapem de uma rede. Ele monitora e protege os dados em três estados diferentes: dados em uso (dados sendo acessados por um usuário), dados em movimento (dados que viajam pela rede) e dados inativos (dados armazenados em uma rede ou dispositivo de computador).|
-