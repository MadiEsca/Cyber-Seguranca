# Arrays

Essa anotação foi tirada diretamente do livro, devido a auto explicação do capítulo, nada será adicionado, qualquer pesquisa a mais deve ser adicionado ao final.

---

Bash allows you to create single-dimension arrays. An array is a collection of elements that are indexed. You can access these elements by using their index numbers, which begin at zero. In bash scripts, you might use arrays whenever you need to iterate over multiple strings and run the same commands on each one.

```shell
#!/bin/bash

# Sets an array
IP_ADDRESSES=(192.168.1.1 192.168.1.2 192.168.1.3)

# Prints all elements in the array
echo "${IP_ADDRESSES[*]}"

# Prints only the first element in the array
echo "${IP_ADDRESSES[0]}"
```

This script uses an array named IP_ADDRESSES that contains three internet protocol (IP) addresses. The first echo command prints all the elements in the array by passing [_*_] to the variable name IP_ADDRESSES, which holds the array values. The asterisk (*) is a representation of every array element.
Finally, another echo command prints just the first element in the array by specifying index 0.

As you can see, we were able to get bash to print all elements in the array, as well as just the first element.
You can also delete elements from an array. Listing 1-17 will delete 192.168.1.2 from the array.

```shell
IP_ADDRESSES=(192.168.1.1 192.168.1.2 192.168.1.3)
unset IP_ADDRESSES[1]
```

You can even swap one of the values with another value. This code will replace 192.168.1.1 with 192.168.1.10:

```shell
IP_ADDRESSES[0]="192.168.1.10"
```

You’ll find arrays particularly useful when you need to **iterate over values** and perform actions against them, such as a list of IP addresses to scan
(or a list of email addresses to send a phishing email to).