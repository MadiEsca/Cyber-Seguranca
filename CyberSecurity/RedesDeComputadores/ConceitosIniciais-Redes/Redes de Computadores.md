# Resumo - Protocolos de Rede
## iP

***Internet Protocol***

## O que é o IP
O *Internet Protocol* é um protocolo de endereçamento, onde cada dispositivo conectado a uma rede recebe um número de IP, de acordo com as configurações pré-estabelecidas. Para entendermos melhor o que é o IP, podemos assimilá-lo a um CPF para dispositivos de uma mesma rede, ou seja, **uma rede NÃO pode ter o mesmo endereço de IP registrado mais de uma vez** já que esses endereços são únicos.
[Conteúdo Completo](Protocolo-IP)

# TCP
---
***Transfer Control Protocol***
## O que é o TCP
Da mesma forma que o IP, o *Transfer Control Protocol* é um protocolo de rede, mas diferentemente do IP ele não trabalha endereçando dispositivos, mas sim garantindo a entrega de **correta de pacotes** dentro de uma rede. Para entendermos melhor esse conceito de TCP, podemos assimilá-lo aos Correios, de forma com que as entregas ocorrem por meio de um endereço (**IP**) e são entregues pelos carteiros(**TCP**).

# DHCP
---
***Dynamic Host Configuration Protocol***
## O que é o DHCP
O *Dynamic Host Configuration Protocol* é um protocolo de rede que serve para atribuir automaticamente algumas configurações de rede para os dispositivos que estão conectados nela, por exemplo:
- Atribuição Automática de **IP's**
- Atribuição Automática de **Endereços DNS**
- Atribuição Automática de **Endereços de Gateway**
- Entre outras configurações de rede que podem ser feitas de forma automática
Com ele podemos facilitar a criação de grandes redes, já que é possível criar servidores DHCP e conectá-los à nossas redes grandes, evitando a necessidade de configurarmos tudo manualmente.

