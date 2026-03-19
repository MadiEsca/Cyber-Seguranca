#! /usr/bin/env bash

user=$(whoami)
user_hostname=$(hostname)
user_running_time=$(uptime)
user_kernel_info=$(uname)

echo "Usuario Encontrado... ${user}"
echo "Hostname do Usuario... ${user_hostname}"
echo "O Usuario esteve ativo desde... ${user_running_time}"
echo "O Usuario está utilizando... ${user_kernel_info}"

array=("nome", "carro", "casa")
