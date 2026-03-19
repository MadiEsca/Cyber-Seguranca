<h1 align="center" style="color:purple">A história</h1>

Antes de realmente termos as redes de computadores como as conhecemos atualmente, ou seja, de forma com que qualquer dispositivo em uma rede possa se comunicar, não tínhamos esse privilégio, de realizarmos essa comunicação com dispositivos de fabricantes diferentes .

Quando as primeiras redes de computadores surgiram, computadores de uma mesma fabricante podiam, tipicamente, comunicar-se entre si. Dessa forma, as empresas se viam obrigadas a **escolherem apenas uma determinada solução**, por exemplo *IBM* ou *DEC¹* (atual HP), por conta de sua compatibilidade.

[^1]:Digital Equipment Corp

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

[^1]:International Organization for Standardization
[^2]:DoD - Departament of Defense

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

[^1]:Request For Proposal - Equivalente a uma licitação
[^2]:Defense Advanced Research Projects Agency Network

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
