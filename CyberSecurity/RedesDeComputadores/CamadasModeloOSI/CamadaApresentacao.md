# Camada de Apresentação

- Essa é a segunda camada do modelo OSI, ficando abaixo apenas da camada de aplicação.
- A camada de apresentação responde às solicitações de serviço da camada acima (***Aplicação***) e envia solicitações imediatamente para a camada inferior (***Sessão***).
- Essa camada, diferentemente das outras, não se preocupa em enviar `bits` para outras camadas, mas sim com a **sintaxe** e a **semântica** dos dados transmitidos.
  - Por exemplo, pode haver a necessidade de converter os dados recebidos da camada de aplicação ou da camada de seção para outro formato que seja melhor compreendido e aceitável pelas outras camadas do modelo.
- Além disso, a camada de aplicação tem outras funções além de **formatar** e **interpretar dados**, que incluem  a **compressão de dados** e **segurança da informação transmitida**. Outras tarefas como **compressão**, **descompressão**, **encriptação** e **decriptação**, também são responsabilidades dessa camada.

## Exemplo de processos de compressão

- **`TIFF`**
- **`MPEG`**
- **`JPEG`**
- **`GIF`**

> As funções de **compressão** e  **segurança** não são exclusivas da camada de apresentação
