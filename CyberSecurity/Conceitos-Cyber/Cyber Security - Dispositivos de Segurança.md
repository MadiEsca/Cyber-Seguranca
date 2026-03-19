- **Roteadores**
  collapsed:: true
	- Tem como principal objetivo **interconectar várias redes locais em uma só rede**
	- Fornece algumas ferramentas para a filtragem de tráfego
		- Útil quando precisamos definir com quais segmentos da rede determinados computadores, ou redes, podem se comunicar.
- **Firewalls**
  collapsed:: true
	- É um dispositivo que tem a capacidade de entrar ainda mais fundo no tráfego da rede, sendo **capaz de identificar vírus e comportamentos anormais na rede** e consequentemente **bloqueá-los**
	- Podem ter diversas **regras de segurança** sobre **todo tráfego** que passa por eles
- **Intrusion Preventios Systems - IPS**
  collapsed:: true
	- Utiliza uma série de protocolos e assinaturas digitais para identificar e bloquear trafego malicioso e outros ataques a rede
- **Virtual Private Networks - VPN**
  collapsed:: true
	- São tuneis seguros, que criptografam o tráfego que passa por eles, de forma com que os dados que passam por essas redes VPN são enviados para outros servidores e encapsulados, impedindo a leitura desses dados, caso eles sejam interceptados.
	- Bastante utilizada quando nos conectamos a uma rede pública que não temos certeza de sua segurança
- **Antmalware e Antvirus**
  collapsed:: true
	- Funcionam de forma semelhante aos IPS's, utilizando um conjunto de assinaturas ou análises de comportamento de aplicações para identificar comportamentos suspeitos e os bloqueá-los.
- ---
- <h1>Firewalls</h1>
- Dentro das redes de computadores, os firewalls são uma importante camada de proteção que temos, já que eles filtram e/ou controlam o tráfego de uma rede (Network-based Firewalls) ou de um único computador (Host-based Firewalls).
  Com o passar do tempo e com o surgimento de ataques cada vez mais sofisticados, novos firewalls foram desenvolvidos, cada um com seu próprio proposito e funcionalidades.
- <h2>Tipos de Firewalls</h2>
- Network Layer
  collapsed:: true
	- Filtra a comunicação com base no IP de quem envia as informações e no IP de quem recebe.
- Transport Layer Firewall
  collapsed:: true
	- *Filters comunnications based on source and destination data ports, as well as connection states.*
- Aplication Layer Firewall
  collapsed:: true
	- Filtra as comunicações de um aplicativo, programa ou serviço.
- Context Aware Layer Firewall
  collapsed:: true
	- Filtra a comunicação se baseando no usuário, dispositivo, função, tipo de aplicação e o perfil de execução
- Servidor Proxy
  collapsed:: true
	- Filtra requisições feitas da web como URLs, nomes de domínio e tipos de arquivos
- Servidor de Proxy Reverso
  collapsed:: true
	- São utilizados em web servers, de forma a filtrar, proteger, esconder, e distribuir acessos para esses servidores.
	- São uma camada extra de proteção para esses servidores web, permitindo com que seja possível filtrar quem vai acessar esses servidores
- Network Adress Translation (NAT) Firewalls
  collapsed:: true
	- Esse tipo de firewall esconde ou mascara os endereços privados de computadores em uma determinada rede
- Host-based Firewalls
  collapsed:: true
	- Filtra portas e acessos a serviços do sistema dentro do sistema operacional de um único computador
	- Um exemplo é o Firewall que vem no windows
- ---
- <h1>Port Scanning</h1>
  <strong style="font-size:small;">Alguns textos estão em inglês, pois os considero de mais fácil legibilidade.</strong>
- *In networking, each application running on a device is assigned an identifier called a port number. This port number is used on both ends of the transmission so that the right data is passed to the correct application. Port scanning is a process of probing a computer, server or other network host for open ports. It can be used maliciously as a reconnaissance tool to identify the operating system and services running on a computer or host, or it can be used harmlessly by a network administrator to verify network security policies on the network.*
- Quando utilizamos um serviço para fazermos a varredura de portas na rede podemos receber algumas `responses`, sendo elas:
	- `Open` or `Accepted` means that the **port** or **service** running on the computer **can be accessed by other network devices**.
	- `Closed`, `Denied` or `Not Listening` means that the **port** or **service is not running** on the computer and therefore **cannot be exploited**.
	- `Filtered`, `Dropped` or `Blocked` means that access to the **port** or **service is blocked by a firewall** and therefore it cannot be exploited.
- ---