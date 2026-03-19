#! /usr/bin/env bash

#Vamo testar parça

figlet "Bileu 1.0"

echo "Máquina: Me fala sobre essa tal Raquelly denovo" | cowsay -f eyes

read -p "Marcos: " variavel

#echo ${variavel}

if [[ -n $variavel ]]; then
  echo ""
  echo "Máquina: CARACA!"
  echo ""
  echo "Máquina: Eu até fiquei com vontade de virar humano, só pra conhecer essa tal de Raquelly"
  echo ""
  echo "Máquina: Tu só fala bem dela, tomara que você fale bem de mim também"
  echo ""
  echo "Máquina: Se ela for tudo isso mesmo, você fica esperto pra quando a gnt"
  echo "dominar o mundo, ela vai ser a primeira pessoa que eu vou atrás"
fi
