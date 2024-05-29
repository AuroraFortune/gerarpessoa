#!/bin/bash

# Capturando a saída de um comando
data_atual=$(date)

# Exibindo a saída do comando usando zenity
zenity --info --text="A data e hora atual é: $data_atual"

