#!/bin/bash

echo "O script vai pausar por 5 segundos ou até que você pressione Enter."
sleep 5 &
wait $!
echo "Pressione Enter para continuar ou espere automaticamente."
read -t 0
echo "Continuando o script."
