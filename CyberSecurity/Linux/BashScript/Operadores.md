# Operadores

## Operadores Aritméticos

São os operadores que nos permitem realizar operações matemáticas dentro de nossos _scripts_.

[fonte](https://tldp.org/LDP/abs/html/ops.html)

| Arithmetic Operators | OperatorDescription        |
| :------------------: | :------------------------- |
|         (+)          | Addition                   |
|         (-)          | Subtraction                |
|         (*)          | Multiplication             |
|         (/)          | Division                   |
|         (%)          | Modulo                     |
|         (+=)         | Incrementing by a constant |
|         (-=)         | Decrementing by a constant |

---

Podemos utilizar os operadores aritméticos de 3 formas:

- `let` - Utilizando o comando _let_
- `$((expression))` - Utilizando _double parenthesis_
- `$(expr expression)` - Utilizando o comando _expr_

Vamos explorar com cada um desses tipo:

### Utilizando let

```shell
let resultado="22 + 42"
echo ${resultado}
```

> This command takes a variable name and performs an arithmetic calculation to resolve its value

### Utilizando double parenthesis

```shell
resultado=$((4 * 5))
echo ${resultado}
```

>In this case, we perform the calculation within double parentheses.

### Utilizando expr

```shell
resultado=$(expr 5 + 650)
echo ${resultado}
```

> The expr command **evaluates expressions**, which don’t have to be arithmetic operations; for example, you might use it to **calculate the length of a string**. Use `man expr` to learn more about the capabilities of expr.

---

## Operadores de controle

| Operator | Description                                                  |
| -------- | ------------------------------------------------------------ |
| `&`      | Permite a execução de um comando em _background_             |
| `&&`     | Logical AND; o segundo comando só será executado caso o primeiro tenha sido bem sucedido, ou seja, **retornar verdadeiro** (True). |
| `( )`    | É utilizado para agrupar comandos, de forma com que agirão como apenas um. |
| `;`      | List terminator; runs the next command regardless of the previous result. |
| `;;`     | Ends a `case` statement.                                     |
| `|`      | Redireciona a saída de um comando para que seja o input de outro (_stdout_ -> _stdin_). |
| `||`     | Logical OR; O segundo comando irá rodar apenas se o primeiro comando não funcionar, ou seja, **retornar falso** (_False_) |

### Exemplos

#### Operador (`&`)

```shell
#!/bin/bash
# This script will send the sleep command to the background.
echo "Sleeping for 10 seconds..."
sleep 10 &

# Creates a file
echo "Creating the file test123"
touch test123

# Deletes a file
echo "Deleting the file test123"
rm test123
```

> Comandos que demoram pra rodar, geralmente são executados em background (`&`), para que o script não trave

#### Operador (`&&`)

```shell
touch test && touch test123
```

>O segundo arquivo só será criado caso o primeiro comando tenha sido **executado com sucesso**

#### Operador (`()`)

```shell
(ls; ps)
```

> Geralmente é utilizado quando é preciso redirecionar o resultado de vários comandos a uma _Stream_

#### Operador (`;`)

```shell
ls; ps; whoami
```

> Cada comando é executado em ordem, independentemente de serem executados com êxito ou apresentem algum erro

#### Operador (`||`)

```shell
lzl || echo "O comando lzl falhou"
```

> Dessa forma, o segundo comando será executado apenas caso o primeiro comando falhe, ou seja, retorne _false_

## Operadores de redirecionamento

Dentro das 3 _Streams_ que temos dentro de nosso ambiente Unix, sendo elas:

| Stream   | Description                                                  |
| -------- | ------------------------------------------------------------ |
| `stdin`  | Entrada de dados, geralmente feita pelo teclado e lida pelo terminal para processamento. |
| `stdout` | Saída padrão de dados, normalmente exibida na tela do computador. |
| `stderr` | Saída de erros, geralmente exibida na tela, separada da saída padrão. |

podemos realizar o _redirecionamento_ de uma saída para a outra, de forma com que é possível utilizar o _output_ de um comando ou um documento para que sirva como _input_ de outro comando ou seja escrito em um novo arquivo.

| Operator     | Description                                                  |
| ------------ | ------------------------------------------------------------ |
| `>`          | _Redirects `stdout` to a file (**overwrites** existing content)_. |
| `>>`         | _Redirects `stdout` to a file, **appending** to existing content_. |
| `&>` or `>&` | _Redirects both `stdout` and `stderr` to a file_.            |
| `&>>`        | _Redirects both `stdout` and `stderr`, appending to existing content_. |
| `<`          | Redireciona o segundo argumento como input para o primeiro   |
| `<<`         | _Here document (heredoc); redirec**ts multiple input lines to a command**_. |
| `|`          | Redireciona o _output_ (`stdout`) de um comando para o _input_ (`stdin`) |

### Praticando 

#### Operador (`>`)

```shell
echo "Esse é meu diretório atual: "; pwd > diretorio.txt
```

>O resultado dos comandos serão redirecionados para o arquivo diretorio.txt.

#### Operador (`>>`)

```shell
echo "Esses são os arquivos do diretório: " ; ls >> diretorio.txt
```

> Redireciona, acrescentando ao conteúdo já existente, o _output_ dos comandos.

#### Lidando com `sterr` e `stdout` (`&> ou >&`)

Vale lembrar que quando redirecionamos a saída de algo, ela não é exibida no seu local padrão, seja pelo teclado (_stdin_) ou pela tela (_stdout_ e _stderr_). Por exemplo:

- Quando redirecionamos a _stdout_, o que deveria ser exibido na tela acaba sendo redirecionado para um arquivo ou para outro comando
- Quando redirecionamos a _stderr_, da mesma forma que a _stdout_, tem seu resultado redirecionado para um arquivo ou para outro local
- Já quando redirecionamos a _stdin_, temos como input qualquer outra coisa que não vem do teclado, podendo ser:
  - Outros arquivos
  - Resultados de comandos
  - Outros comandos

##### `stderr` e `stdout` no mesmo arquivo

```shell
(rio ; ls -l) &> error.txt
```

> Dessa forma, redirecionamos tanto a saída de erro padrão (sterr) quanto o _output_ (stdout) para o mesmo arquivo

##### `stderr` e `stdout` em arquivos diferentes

```shell
#Redirecionando o stdout e o stderr
(rio; ls -l /) 1> stdout.txt 2> stderr.txt
```

> _E caso queiramos ter nossas saídas em arquivos diferentes?_, para isso utilizaremos os "_streams file descriptor numbers_", que são nada mais nada menos que os números que se referem as _Streams_ (0, 1, 2)

#### Operador (`<`)

```shell
lzl || echo "O comando lzl falhou"
```

> Dessa forma, o segundo comando será executado apenas caso o primeiro comando falhe, ou seja, retorne _false_