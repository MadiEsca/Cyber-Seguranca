# Comando Set

> Importante!
>
> fonte: [Geeks for geeks](https://www.geeksforgeeks.org/linux-unix/shell-scripting-set-command/)

O comando `set` é utilizado para **definir** e **retirar** _flags_ e configurações específicas dentro de um shell, além de poder ser utilizado para mostrar ou modificar parâmetros e atributos do shell atual.

> The `set` command in shell scripting is a powerful tool that used for controlling the behavior of the shell and the environment in which scripts run. It allows the users to modify the shell options and positional parameters which facilitates providing greater control over script execution and debugging.

## Syntax

```shell
set -options arguments
```

## Options of Set command in Linux

| ***Option*** | ***Description***                                            |
| :----------: | :----------------------------------------------------------- |
|      -a      | use to mark variables that are created or modified or created for export. |
|      -b      | use to notify the termination of the job.                    |
|      -e      | use to exit when the command exits with a non-zero status.   |
|      -f      | it disables the file name generation known as globbing       |
|      -h      | It saves the location of the command where it got looked.    |
|      -k      | It places all assignment arguments in the environment variable of a command.Exception: It excludes all arguments that precede the command name. |
|      -m      | It enables job control                                       |
|      -n      | It is used to read the commands.                             |
|      -o      | It is used for naming the option                             |
|      -p      | It disables the processing of the '$ENV' file and also imports the shell functions.Turned on:  when the real and effective user ids do not match. |
|      -t      | It uses to exit from the command after executing a single command |
|      -u      | It treats unset variable as an error during substitution     |
|      -v      | It prints the shell input lines                              |
|      -x      | It prints the commands and their arguments in the same sequence as they got executed. |
|      -B      | It performs the Brace expansion by the shell                 |
|      -C      | It disallows the existing regular files to be overwritten    |
|      -E      | used when shell functions inherit the ERR trap               |
|      -H      | It enables style history substitution. It is on by default.  |
|      -P      | used when during command execution we don't want to follow the symbolic links. |
|      -T      | set this flag, this helps shell functions to inherit the DEBUG trap |

---

## Examples

### Set -x command

- This option prints the commands in the sequence as they got executed or is mainly used to do some script debugging.

***Code***

```shell
set -x
echo Hello
echo Romy
```

***Output***

```shell
bar
hello
Romy
+ echo bar
+ echo hello
+ echo Romy
```

---

### Set -e command

- It terminates the execution **when the error occurs**.

***Code:(without set -e)***

```shell
echo Hello
foo
echo Romy
```

***Output***

```shell
Hello
Romy
main.sh: line 14: foo: command not found
```

- 'foo' is a non-existent command but bash still executed the third line after encountering the error at the second line. We can use the set command to stop termination.

***Code: (with set -e)***

```shell
set -e
echo Hello
foo
echo Romy
```

**Output**

```shell
Hello
main.sh: line 15: foo: command not found
```

- We can see that the third line is not getting printed as the execution got terminated after the second line.

### Pipe commands

The Set -e command does not work with piped commands.

**Example**

```shell
set -e
foo | echo " This is the piped command"
echo "executed"
```

**Output**

```shell
This is the piped command
executed
main.sh: line 3: foo: command not found
```

- We can see that third line is getting executed, instead of terminating the execution after the second line.
- To overcome this problem, we have to use `set -eo pipefail`

#### ***Set -eo pipefail***

**Example**

```shell
set -eo pipefail
foo | echo " This is the piped command"
echo "executed"
```

**Output**

```shell
This is the piped command
main.sh: line 13: foo: command not found
```

---

## ***Set positional parameters using set command***

**It can be used to assign values to positional parameters**. Position of the value referenced as `${N}` where N denotes the **position** of the parameter.

The $1 is the first positional parameter after the command. The $2 value is the second parameter, and so on.

***Example***

```
set apple mango orange guava
echo $1
echo $2
echo $3
echo $4
```

----

## ***Unset positional parameters***

In order to unset the positional parameter, run the set command followed by two hyphens(set --).

***Example***

```
set apple mango orange guava

set --
echo $1
echo $2

echo "Hello"
```

---

##  nome="Marcos"echo ${nome}unset nomeecho ${nome}shell

The following are the features of set command:

- ***Environment Variable Management***: It allows users to display, set, or unset environment variables in the command shell.
- ***Control Shell Behavior***: It can modify shell options and control the behavior of the command interpreter.
- ***Script Debugging***: Enables or disables debugging features to assist in script development and troubleshooting.
- ***Conditional Execution***: Helps in the conditional execution of commands by setting options that affect command processing.