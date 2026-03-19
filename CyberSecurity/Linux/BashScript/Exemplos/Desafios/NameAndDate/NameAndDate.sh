#! /usr/bin/env bash

#Script que solicita o nome e sobrenome do usuario, e cria um arquivo de backup com a data atual

user_name=${1}
user_second_name=${2}
date_now=$(date +%d/%m/%Y)

echo " ${date_now} ${user_name} ${user_second_name}" > output.txt

cp output.txt backup.txt

cat output.txt
