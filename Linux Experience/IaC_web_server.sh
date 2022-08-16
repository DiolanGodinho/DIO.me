#!/bin/bash


#=========================================
#  Atualizando o servidor
#=========================================

echo "Atualizando o sistema ..."

apt-get update -y

apt-get upgrade -y

#=========================================
#  Instalando Apache
#=========================================

echo "Instalando o apache ..."

apt-get install apache2 -y

#=========================================
#  Instalando o unzip
#=========================================

echo "Instalando o unzip ..."

apt-get install unzip -y

#=========================================
# Baixando o código da aplicação 
#=========================================

echo "Baixando os arquivos com os codigos ..."

wget -P /tmp -O main.zip https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip

#=========================================
# Descompactando a pasta 
#=========================================

echo "Descompactando o conteudo baixado ..."

unzip /tmp/main.zip

#=========================================
# Copiando o código para a pasta padrao
# do apache 
#=========================================

echo "Copiando os codigos para a pasta padrao do apache ..."

rm /var/www/html/*.html

cp -R /tmp/linux-site-dio-main/* /var/www/html/

echo "Script Finalizado!"
