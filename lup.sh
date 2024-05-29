#!/bin/bash

(
    for i in {1..100}; do
        echo $i   # Envia a porcentagem para o zenity
        sleep 0.1  # Simula um trabalho sendo feito
	
    done
) | zenity --progress --title="Progresso da Tarefa" --text="Executando a tarefa..." --percentage=0 --auto-close

# Verifica se o usuário cancelou a operação
if [ $? = 1 ]; then
    zenity --error --text="Operação cancelada pelo usuário."
fi
