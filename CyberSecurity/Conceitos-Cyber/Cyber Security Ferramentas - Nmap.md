- Pacotes Syn, Syn-ack, ack
- rst
-
- ### Fazendo uma varredura dos hosts de uma rede
- ```Shell
  nmap 192.168.2.0/24 -sn
  ```
	- Explicação:
		- 192.168.2.0/24
			- Endereço e máscara da rede que será utilizada, com essa máscara ele faz um scan em todos os 256 endereços de rede
			- A máscara pode ser alterada de acordo com a necessidade
		- -sn
			- Apenas verifica se o host está ativo
			- Não realiza o scan de portas
		-