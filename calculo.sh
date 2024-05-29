#!/bin/bash

# URL do arquivo a ser baixado


url=""
output_file=""

# Obtém o tamanho total do arquivo
total_size=$(curl -sI $url | awk '/Content-Length/ {print $2}' | tr -d '\r')

# Inicializa a variável de progresso
progress=0

# Função para atualizar o progresso do download
update_progress() {
    # Obtém o tamanho atual do arquivo baixado
    downloaded_size=$(stat -c %s "$output_file" 2>/dev/null || echo 0)

    # Calcula a porcentagem de progresso
    progress=$(( downloaded_size * 100 / total_size ))

    # Envia a porcentagem para o zenity
    echo $progress
}

# Inicia o download em background
curl -o $output_file $url --silent &

# Captura o PID do processo de download
pid=$!

# Atualiza a barra de progresso enquanto o download está em andamento
(
    while kill -0 $pid 2> /dev/null; do
        update_progress
        sleep 1
    done
    # Garantir que o progresso chegue a 100% no final do download
    update_progress
) | zenity --progress --title="Baixando Arquivo" --text="Fazendo download do arquivo..." --percentage=0

# Verifica se o usuário cancelou a operação
if [ $? = 1 ]; then
    zenity --error --text="Operação cancelada pelo usuário."
    # Remove o arquivo incompleto
    kill $pid 2>/dev/null
    rm -f $output_file
fi
