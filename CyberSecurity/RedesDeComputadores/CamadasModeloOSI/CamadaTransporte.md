# Camada de Transporte

- Essa é a quarta camada do **Modelo de referência OSI**, ficando abaixo apenas das camadas: "***Aplicação***", "***Apresentação***", "***Sessão***"

- A camada de transporte é responsável pela **segmentação** e **reconstrução** de fluxos de dados provenientes de camadas superiores, provendo uma conexão ponto-a-ponto entre a **aplicação de origem** e a **aplicação de destino**.

  - *Aplicação de origem*: Aplicação de onde os **dados estão saindo**, ou seja, a origem do(s) dado(s)
  - *Aplicação de destino*: Aplicação que **solicita os dados**, ou seja, o destino do(s) dado(s)

  Além disso, essa camada tem a responsabilidade de fornecer mecanismos para **multiplexar fluxos de dados** e de **estabelecer** e **finalizar** (*quebrar*) **circuitos virtuais** (*lógicos*).

- Essa camada mascara os detalhes relacionados à rede das camadas superiores.

## Controle de Fluxo

A camada de transporte assegura a integridade dos dados por meio do controle do fluxo de dados e permitindo que usuários realizem requisições por meio de um transporte seguro de dados. Para que essa comunicação ocorra conforme o planejado, é necessário que uma **comunicação orientada a conexão** seja estabelecida entre o **computador de origem** e o **computador destinatário**, sendo necessário que os protocolos envolvidos se assegurem as seguintes implementações:

- Os segmentos são confirmados (*acknowledged*) ao serem recebidos;
- Qualquer segmento não confirmado é retransmitido;
- Os segmentos são reconstituídos em sua sequência original, uma vez recebidos pelo computador destinatário;
- Uma gerência do fluxo de dados é mantida a fim de evitar congestionamento, sobrecarga e perda de dados.

> *Enquanto os dados estão sendo transmitidos entre dispositivos, ambos verificam periodicamente a conexão, a fim de verificar se os dados estão sendo transmitidos e recebidos apropriadamente.*

Quando falamos sobre a perda de dados, temos que ter em mente que ela pode ocorrer de diversas formas quando se trata de comunicação:

- Congestionamento na rede
  - Um computador pode enviar dados mais rapidamente do que outro tem a capacidade de receber, ou vice versa.
  - Diversos computadores passam a transmitir *datagramas* para um mesmo *gateway* ou destino, dessa forma, o *gateway* ou o destino podem ficar sobrecarregados mesmo que nenhum dos outros computadores sejam a fonte do problema.
- Sobrecarga de datagramas
  - Quando o computador destinatário recebe mais *datagramas* do que pode processar, dessa forma seu *buffer* fica inundado, fazendo com que aja uma perda de dados.

Quando uma máquina recebe mais *datagramas* do que pode processar, ela os envia para o *Buffer*, uma pequena memória de acesso rápido, em um processo chamado de *bufferização* (*buffering*), que só funciona se o fluxo de dados **não for contínuo**, mas sim algo como uma **"rajada de dados"**. Entretanto, caso o envio de dados seja ininterrupto, a memória *buffer* vai, eventualmente, se esgotar. Mas, a camada de transporte tem a capacidade de lidar com esses gargalos, por meio do envio de sinais, que indicam ao emissor se é possível (***Ready***) ou não (***Not ready***).

Em uma comunicação de dados confiável, orientada a conexão, os datagramas devem ser entregues na **exata ordem em que foram enviados**; do contrário, um *erro de comunicação* ocorre, da mesma forma que quando um segmento é **perdido**, **duplicado** ou **corrompido** durante o processo.

Entretanto, a taxa de transmissão de dados seria extremamente baixa se a máquina transmissora tivesse que esperar por cada confirmação para poder enfim enviar outro segmento. Por tanto, uma vez que exista tempo, o transmissor envia segmentos antes de finalizar o processamento de cada confirmação.

## Confirmação (*acknowledgement*)

Uma conexão confiável garante a total integridade dos dados transmitidos entre dois pontos. Essa garantia existe por conta do método conhecido como "confirmação positiva com retransmissão", ou em inglês, "*positive acknowledgement with retransmition*". Técnica que consiste no envio de uma mensagem de confirmação por parte do receptor para o transmissor quando o recebimento dos dados tiver êxito, garantindo assim que nenhum dado seja perdido ou duplicado.

## Significados

- *Multiplexar* - Significa transmitir diversas informações simultaneamente usando-se, ou não, um mesmo sinal ou canal, implicando que essas informações podem ser extraídas em um meio ou canal particular.
- *Buffer* - Memória de acesso rápido destinada ao armazenamento temporário de pequenas quantidades de dados.

- *Datagrama* - É o cabeçalho que contém as informações do pacote que é trafegado por meio dos protocolos.