#!/bin/bash



source .config.cfg

local_pt='pt_BR'
local_us='en_US'


pergunta=$(zenity --entry --text="Brasileiro (BR) ou (US) Para Americano")
if [ $pergunta = 'BR' ]; then
    nome=$(curl -s https://api.invertexto.com/v1/faker\?token\=$token\&locale\=$local_pt | jq '.name' )
    data=$(curl -s https://api.invertexto.com/v1/faker\?token\=$token\&locale\=$local_pt | jq '.birth_date' )
    cpf=$(curl -s https://api.invertexto.com/v1/faker\?token\=$token\&locale\=$local_pt | jq '.cpf' )
    email=$(curl -s https://api.invertexto.com/v1/faker\?token\=$token\&locale\=$local_pt | jq '.email' )
    senha=$(curl -s https://api.invertexto.com/v1/faker\?token\=$token\&locale\=$local_pt | jq '.password' )
    zenity --notification --text="você escolheu um Brasileiro"
   mensagem="'Nome: $nome' \n \n'Data: $data' \n \n'Cpf: $cpf' \n \n'Email: $email' \n \n'Senha: $senha'"
   zenity --info --text="$mensagem"
elif [ $pergunta = 'US'  ]; then
    nomeU=$(curl -s https://api.invertexto.com/v1/faker\?token\=$token\&locale\=$local_us | jq '.name' )
    dataU=$(curl -s https://api.invertexto.com/v1/faker\?token\=$token\&locale\=$local_us | jq '.birth_date' )
    #cpfU=$(curl -s https://api.invertexto.com/v1/faker\?token\=$token\&locale\=$local_us | jq '.cpf' )
    emailU=$(curl -s https://api.invertexto.com/v1/faker\?token\=$token\&locale\=$local_us | jq '.email' )
    senhaU=$(curl -s https://api.invertexto.com/v1/faker\?token\=$token\&locale\=$local_us | jq '.password' )
    zenity --notification --text="you chose an american"
    mensagemU="'Nome: $nomeU' \n \n'Data: $dataU' \n  \n'Email: $emailU' \n \n'Senha: $senhaU'"
    zenity --info --text="$mensagemU"

else
    erro='Brasileiro (BR) ou (US) Para Americano\n  \nBrazilian (BR) or (US) To American'
    zenity  --title="ERRO" --error --text="$erro"
    ./estudo.sh

fi