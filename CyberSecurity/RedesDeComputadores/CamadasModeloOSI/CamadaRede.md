# Camada de Rede

- É a 5° camada do modelo OSI, sendo responsável por realizar a comunicação entre dispositivos dentro da *Internetwork* e pelo endereçamento lógico dos pacotes de dados, ou seja, máquinas que não se encontram diretamente conectadas, de forma física.
- Os **roteadores** (*routers*) são dispositivos dessa camada, fornecendo todos os serviços necessários para o roteamento de dados.
  - Não propagam mensagens *broadcast* ou *multicast* pela rede, diferentemente de ***hubs*** e ***switchs***.

---

Como já foi mencionado anteriormente, quando trabalhamos com a camada de rede, tratamos de **pacotes**, que se resumem a basicamente 2:
- Pacotes de dados
	- Pacotes relacionados ao tráfego de dados dentro da *Internetwork*.
	- Os protocolos que trabalham em cima desses pacotes são conhecidos como ***protocolos roteados***.
	  - Exemplos - **`IP`** e **`IPX`**
- Pacotes de atualização
	- Pacotes relacionados a atualizações do roteador.
	- É utilizado para o transporte de dados relacionados a atualizações sobre *routers* vizinhos e sobre os caminhos (*paths*) disponíveis para alcançá-los.