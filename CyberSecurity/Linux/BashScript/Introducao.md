# Introdução

Todo o conteúdo aqui foi embasado no livro **Black hat bash** e em algumas outras pesquisas feitas ao longo da leitura deste livro. Por conta disso, haverá algumas misturas de idiomas, como o inglês com português.

---

## Estrutura de um Script

Como qualquer código, um script também tem uma estrutura a ser seguida, e nossos scripts obrigatoriamente se iniciam com o que chamamos de *shebang line*(`#!`).

### Shebang Line

É uma sequência de caracteres(`#!`) seguida do caminho para o terminal, normalmente localizado em `/bin/bash`. 

- Exemplo: `#! /bin/bash`
  - Como em alguns dispositivos o `bash` pode estar em uma localização diferente do padrão, o que, em alguns testes de penetração, pode dificultar a utilização do script. Para resolver esse problema, basta escrever a *shebang line* da seguinte forma:
    - `#! /bin/usr/env bash`
      - Com isso, assim que o script for executado, ele irá buscar automaticamente o local do interpretador bash

Com isso, também é possível alocar outro interpretador, como *python* ou *ruby*, para executar os scripts, dessa forma, a *shebang line* que utiliza um interpretador python terá a seguinte sintaxe: `#! /usr/bin/env python3`

> Some typical shebang lines:
>
> - `#! /usr/bin/env bash` - Execute the file using the Bash shell using the **env program search path** to find it.
> - `#! /bin/sh` – Execute the file using the [Bourne shell](https://en.wikipedia.org/wiki/Bourne_shell), or a compatible shell, assumed to be in the /bin directory
> - `#! /bin/bash` – Execute the file using the [Bash shell](https://en.wikipedia.org/wiki/Bash_shell)
> - `#! /usr/bin/pwsh` – Execute the file using [PowerShell](https://en.wikipedia.org/wiki/PowerShell)
> - `#! /usr/bin/env python3` – Execute with a [Python](https://en.wikipedia.org/wiki/Python_(programming_language)) interpreter, using the [env](https://en.wikipedia.org/wiki/Env) program search path to find it
> - `#! /bin/false` – Do nothing, but return a non-zero [exit status](https://en.wikipedia.org/wiki/Exit_status), indicating failure. Used to prevent stand-alone execution of a script file intended for execution in a specific context, such as by the **`.`** command from sh/bash, `source` from csh/tcsh, or as a .profile, .cshrc, or .login file.

#### Argumentos

Dentro de nossos scripts podemos adicionar _flags_ para alterar o comportamento do nosso script. Podemos fazer isso por meio de diversas flags, como por exemplo:

- `-x` - Exibe os comandos e os resultados conforme são executados pelo terminal, útil para _realizar debugs_
- `-r` - Executa o script de forma restrita, restringindo possíveis comandos que, por exemplo, podem navegar a certos diretórios do sistema, possam apagar algum arquivo, alterar algum informação entre outras coisas que podem afetar, de forma negativa, que a máquina de quem executou o script

> **Specifying an argument within the shebang line requires modifying the script, but you can also pass arguments to the bash interpreter by using**
> **this syntax:**
>
> `$ bash -r myscript.sh`

**Pontos importantes**

- Por padrão scripts criados **sem a _shebang line_** são executados pelo mesmo programa do processo pai, ou seja, se o processo pai for um terminal _bash_ ele o utilizará, se for um _interpretador python_ ele que será utilizado.

TODO: _Pesquisar a respeito dos argumentos que podem ser passados por meio do shebang line_

---

### Comentários

> Comments are parts of a script that the bash interpreter won’t treat as code and that can improve the readability of a program. Imagine that you write a long script and, a few years later, need to modify some of its logic. If you
> didn’t write comments to explain what you did, you might find it quite challenging to remember the purpose of each section.
> Comments in bash start with a hash mark (#), as shown in Listing 1-5.
>
> ```shell
> #!/bin/bash
> # This is my first script.
> ```
>
> ​	Listing 1-5: A comment in a bash script
>
> To write a multiline comment, precede each individual line with the hash mark, as shown in Listing 1-6.
> ```shell
> #!/bin/bash
> # This is my first script!
> # Bash scripting is fun...
> ```
>
> Listing 1-6: A multiline comment
> In addition to documenting a script’s logic, comments can provide meta­data to **indicate the author**, **the script’s version**, **the person to contact for**
> **issues**, and more.

---

### Executando um Script

> To run the script, save the file as `<script-name>.sh`, open the terminal, and navigate to the directory where the script resides. If you saved the file in your **home directory**, you should run the set of commands shown in Listing 1-7.
>
> ```shell
> cd ~
> chmod u+x helloworld.sh
> ./helloworld.sh
> Hello World!
> ```
>
> Listing 1-7: Running a script from the home directory
> We use the cd command to change directories. The tilde (~) represents the home directory of the current running user. Next, we use chmod to set the executable (u+x) permissions for the user who owns the file (in this case, us). We run the script by using dot-slash notation (./) followed by the script’s name. The dot (.) represents the current directory, so we’re essentially telling bash to run helloworld.sh from the current work­ing directory.
> You can also run a bash script with the following syntax:
>
> ```shell
> bash helloworld.sh
> ```
>
> Because we specified the `bash command`, the **script will run using the bash interpreter** and won’t require a shebang line. Also, if you use the bash command, the script doesn’t have to be set with an executable permission (+x). **In later chapters, you’ll learn about the permission model in more depth and explore its importance in the context of finding misconfigurations in penetration tests.**

---

### Debugging

> Errors will inevitably occur when you’re developing bash scripts. Luckily, debugging scripts is quite intuitive. An easy way to check for errors early is by using the `-n` parameter when running a script:
>
> ```shell
> bash -n script.sh
> ```
>
> - This parameter will read the commands in the script but **won’t execute them**, **so any syntax errors that exist will be shown on screen**. You can think of `-n` as a dry-run method to test the validity of your syntax.
>
> You can also use the `-x` parameter to turn on _verbose mode_, which lets you see commands being executed and will help you debug issues as the script executes in real time:
>
> ```shell
> bash -x script.sh
> ```
>
> If you want to start debugging at a given point in the script, include the `set` command in the script itself (Listing 1-8).
>
> ```shell
> #!/bin/bash
> set -x
> --snip--
> set +x
> ```
>
> _Listing 1-8: Using set to debug a script_
> **You can think of set as a valve that turns a certain option on and off**. In this example, the first command **sets the debugging mode** (`set -x`), while the last command (`set +x`) **disables** it. By using `set`, you can avoid generating
> a massive amount of noise in your terminal when your script is large and contains a specific problem area.

Como em qualquer código que criamos, o _debug_ do mesmo é uma das etapas mais importantes, principalmente para atestar o funcionamento do código. Para nossa sorte, podemos fazer a utilização de alguns parâmetros dentro, ou fora, dos nossos scripts para validar o funcionamento esperado do nosso script.

- `-x` - É o modo verboso de execução. Executa o código e mostra o que foi executado.
- `-n` - Irá ler os comandos digitados mas **não os executará**, de forma com que irá mostrar na tela somente os erros de sintaxe, não o resultado dos comandos.

Dessa forma é possível utilizar esses comandos seja por meio da _shebang line_ ou como uma _flag_ do comando bash, sendo a segunda a mais recomendável.

Conforme nossos scripts vão crescendo, surge a necessidade de realizarmos o _debug_ de determinadas partes do código, e para que nosso terminal não vire uma bagunça, é possível utilizar o comando `set` para criar essas "pequenas áreas de debug", da seguinte forma:

```shell
#! /usr/bin/env bash

set -n
--snip--
set +n
```

- onde --snip-- é o código que será debugado

