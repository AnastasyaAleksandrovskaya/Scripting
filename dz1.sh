#!/bin/bash
TRUEE = 0
FALSEE = 0
RED = '\e[0;31m'
GREEN = '\e[0;32m'
RESET = '\e[0m'
while [[ true ]]; do
	rnd=$(shuf -i 0-9 -n 1)	
	read -p "Я загадал цифру, попробуйте угадать ее!" input
	[[ "${input}" == 'q' ]] && { echo "Конец"; exit 0; }
	[[ "${input}" =~ ^[0-9]$ ]] || { echo "Введите цифру от 0 до 9"; continue; }
	if (( "${input}" == rnd )); then
		TRUEE = $((TRUEE + 1))
		random_list += "${RED}${rnd}${RESET}"
		echo "Вы угадали загаданную цифру"
	else
		FALSEE = $((FALSEE + 1))
		random_list += "${RED}${rnd}${RESET}"
		echo "Вы не угадали загаданную цифру"
	fi
	RESULT=$((truee * 100/(TRUEE + FALSEE)))
	echo "Вы угадали: ${RESULT}%, Вы не угадали: $((100 - RESULT))%"
	echo "Загаданные числа: ${random_list[@]}"
done