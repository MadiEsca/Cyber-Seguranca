- <h1 align="center" style="color:red" ">Importante</h1>
- Apenas o protocolo IP na versão 4 (IPV4) possui essas classes, enquanto o **IPV6 não tem classes**.
- Dentro do protocolo IPV4, temos algumas classes, que servem para definir alguns padrões entre as redes, como por exemplo
	- Número máximo de redes por classe
	- Número máximo hosts (dispositivos/IP's) por rede
- ---
- # Tipos de classes IPV4:
- **Classe A**
	- **Intervalo de IP público**: *1.0.0.0 a 127.0.0.0*
	  collapsed:: true
		- Intervalo de valores do **primeiro octeto** *de 1 a 127*
	- **Intervalo de IP privado**: *10.0.0.0 a 10.255.255.255*
	- **Máscara de sub-rede**: *255.0.0.0 (8 bits)*
	- **Número de redes**: *126*
	- **Número de hosts por rede**: *16.777.21*
- **Classe B**
	- **Intervalo de IP público**: **128.0.0.0 a 191.255.0.0**
	  collapsed:: true
		- Intervalo de valores do **primeiro octeto** de *128 a 191*
	- **Intervalo de IP privado**: *172.16.0.0 a 172.31.255.255*
	- **Máscara de sub-rede**: *255.255.0.0 (16 bits)*
	- **Número de redes**: *16.382*
	- **Número de hosts** por rede: *65.534*
- **Classe C**
	- **Intervalo de IP público**: 192.*0.0.0 a 223.255.255.0*
		- Intervalo de valores do **primeiro octeto** de *192 a 223*
	- **Intervalo de IP privado**: *192.168.0.0 a 192.168.255.255*
	- **Intervalo de IP especial**: *127.0.0.1 a 127.255.255.255*
	- **Máscara de sub-red**e: *255.255.255.0 (24 bits)*
	- **Número de redes**: *2.097.150*
	- **Número de hosts por rede**: *254*
- **Classe D**
	- **Intervalo**: *224.0.0.0 a 239.255.255.255*
		- Intervalo de valores do **primeiro octeto** de *224 a 239*
	- **Número de redes**: *N/A*
	- **Número de hosts por rede**: *Multicast*
- **Classe E**
	- **Faixa**: *240.0.0.0 a 255.255.255.255*
		- Intervalo de valores do **primeiro octeto** de *240 a 255*
	- **Número de redes**: *N/A*
	- **Número de hosts por rede**: *Pesquisa/Reservado/Experimental*
- ## Classe A
  
  
  ---
- # Anotação aleatória
- ## Mascara CIDR
  Dado determinado IP com o CIDR, calcule o valor da mascara de rede
  **192.168.0.1/27**
  O valor dado pelo CIDR foi 27, mas oq isso quer dizer? Quer dizer que temos **27 números 1 na nossa máscara de rede**.
  Mas, vamos lembrar que essa **mascara segue o mesmo padrão do IP**, ou seja, **4 grupos de 8 bit**s, ou, **4 octetos**. Da seguinte forma:
- 192.168.0.1
  Onde cada número representa 8 bits convertidos em números decimais. *Mas como seria esse número em bits (binário)?* Ele ficaria da seguinte forma:
- 11000000.10101000.00000000.00000001
  Onde temos 4 grupos de 8 números (Bits)
  Com esses conceitos frescos na mente, vamos partir para o cálculo da máscara de rede:
- Como foi dito, o valor do CIDR corresponde ao número de "1" que temos na nossa máscara, ou seja vamos colocá-los na mesma disposição de 4 octetos:
	- 11111111.11111111.1111111.11100000
- Ficando dessa forma, com 27 "1" e para completar o último octeto, colocamos o restante com "0"
  Após obter esse valor, vamos convertê-lo agora para decimal, utilizando a seguinte tabela como base
  [colocar a foto da tabela]
  onde conseguiremos obter o valor da máscara de rede, que no nosso caso é:
- 255.255.255.224 ou 11111111.11111111.1111111.11100000
  ---
- ## Calculando o número de Hosts por Sub-Rede
  Como já temos o valor da nossa máscara de rede convertida em binário, vamos seguir os seguintes passos
- Pegaremos o octeto misto
  collapsed:: true
	- *Misto pois conta com 0's e 1's*
	- O último octeto que é diferente de 0 e 255
	- 255.255.255.224 -> Usamos o 224
	- 255.255.192.0 -> Utilizamos o 192
	- 255.224.0.0 -> Utilizamos o 224
- Após pegarmos o valor do octeto misto, vamos subtrair seu valor por **256**, que é a quantidade de bits possíveis de termos (0 - 255)
  collapsed:: true
	- Seguindo o exemplo: 224 - 255 = 32
	- 32 é o intervalo de IP's (**saltos**) que teremos entre cada sub-rede.
		- *Vale lembrar que não teremos 32 dispositivos/hosts nessas sub-redes*
		- Teremos apenas 30 dispositivos por sub-rede, já que temos **2 endereços reservados e que não podem ser utilizados**, sendo:
			- **Endereço de rede**: **Menor** valor dentro do intervalo da nossa sub-rede, que é gerado com base na nossa máscara de rede.
			- **Endereço Broadcast**: **Maior** valor dentro do intervalo da nossa sub-rede, que é gerado com base na nossa máscara de rede.
- ### Criando as Sub-redes
  Agora que já sabemos o intervalo (**saltos**) de IP que temos entre cada uma das sub-redes (32) vamos criá-las.
  Como não temos uma quantidade delimitada de sub-redes que temos que criar, vamos criar 3 sub-redes:
- 1° - 192.168.0.0 até 192.168.0.32
- 2° - 192.168.0.33 até 192.168.0.64
- 3° - 192.168.0.65 até 192.168.0.96
-