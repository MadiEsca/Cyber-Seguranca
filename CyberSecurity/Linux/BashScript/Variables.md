# Variáveis

Toda linguagem de programação possui variáveis, que são nada mais nada menos que espaços nomeados na memória que armazenam algum valor.

Como sabemos, em qualquer linguagem de programação as variáveis podem assumir diferentes tipos, seja `integers`, `strings`, `booleans`, `arrays` entre outros tipos. Dentro do _bash_ todas as variáveis são `untyped`, sendo todas consideradas como _characters strings_, mas, veremos que o _bash_ nos permite **criar arrays**, **acessar arrays** e **realizar operações aritméticas** desde que os valores da variável consistam de apenas valores numéricos.

> Para criar variáveis é necessário seguir as seguintes regrsa:
>
> - Podem conter caracteres alfanuméricos.
> - Não podem iniciar com números.
> - Podem conter underscores (_).
> - Não podem conter espaços em branco.

---

## Criando e acessando valores de uma variável

Para criarmos uma variável utilizamos a seguinte sintaxe

```shell
book="black hat bash"
```

Dessa forma, criamos uma variável chamada _book_ e, utilizando o sinal de igual (=), atribuimos o valor "_black hat bash_" a ela. Agora podemos utilizá-la para acessar seu valor dentro de um comando.

> IMPORTANTE!
>
> Não podemos ter espaços entre o nome da variável + sinal e igual + valor variável, da seguinte forma:
>
> - Forma Correta: `nome="Marcos"`
> - Forma Errada: `nome = "Marcos"`

Vamos utilizá-la em conjunto com o comando `echo` 

```shell
echo "This book's name is ${book}"

#This book's name is black hat bash
```

Acessamos o valor da nossa variável por meio usando `${book}`, em conjunto com o comando `echo`, de forma com que o `${book}` tem seu nome substituído pelo seu valor. 

Também é possível acessar o valor dessa variável utilizando apenas o sinal de dólar (`$`) e o nome da variável

```shell
echo "This book's name is $book"
```

Mas, a sintaxe `${}` oferece uma chance maior do código ser executado corretamente, além de facilitar a identificação de uma variável, onde ela inicia e termina.

É possível atribuir o _output_ de um comando a uma variável, utilizando a **command substitution syntax** `$()`, colocando o comando dentro dos parenteses, pode ter certeza que isso será bastante utilizado.

```shell
root_directory=$(ls -ld /)
echo "${root_directory}"
```

> We assign the value of the ls -ld / command to a variable named root_directory and then use echo to print the output of the command. In this output, you can see that we were able to get metadata about the root directory (/), such as its type and permission, size, user and group owners, and the timestamp of the last modification.

---

## Desatribuindo valores de uma variável

Da mesma forma que é possível criar uma variável, é possível também desalocar essa variável, utilizando o simples comando `unset` + variável, da seguinte forma:

```shell
nome="Marcos"
echo ${nome}
unset nome
echo ${nome}
```

----

## Escopo de variáveis

**Variáveis globais** podem ser utilizados por todo o script. Mas, da mesma forma que existem variáveis globais, existem também as **variáveis locais**, que só podem ser acessadas dentro de um bloco de código específico. Para definirmos que uma variável é local, utilizamos a _keyword_ _`local`_ + `variável`, da seguinte forma:

```shell 
#! /usr/bin/env bash

NAME="Marcos"

print_name(){
	local LASTNAME
	LASTNAME="Soares"
	echo "Seu nome é: ${NAME} e seu sobrenome é 			${LASTNAME}"
}

print_name

echo "A variável ${LASTNAME} nunca será exibida pois é local"
```

