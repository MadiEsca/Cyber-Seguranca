#!/usr/bin/env bash

#Script de exemplo da utilização do continue

#touch example_file_1.txt
#touch example_file_2.txt
#touch example_file_3.txt

for file in example_file*.txt; do
	if [[ "${file}" == "example_file_1.txt" ]]; then
		echo "Pulando o primeiro arquivo"
		continue
	fi
	echo "${RANDOM}" > "${file}"
done
