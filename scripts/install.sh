#!/bin/bash

echo "Bem vindo ao instalador do CD-MOJ!"
sleep 3

echo "Criando pastas"
chmod a+rwx cdmoj-dev
mkdir cd-moj
cd cd-moj
mkdir moj-serverside 
mkdir moj-pagina
mkdir moj
mkdir moj/submissions
mkdir moj/contests
mkdir tmp
cd ..
cp -r examples/docker-contest cd-moj/moj/contests/

echo "Substituindo arquivos"
cp config/apache2.conf /etc/apache2/
cp config/moj.conf /etc/apache2/sites-available/
cp config/serve-cgi-bin.conf /etc/apache2/conf-available/

echo "Configurando apache2"
ln -s etc/apache2/mods-available/cgi.load /etc/apache2/mods-enabled/cgi.load
a2dissite 000-default
a2ensite moj
a2enmod include

echo "Clonando repositorio do cdmoj"
cd cdmoj-dev
git clone https://github.com/cd-moj/cdmoj.git
cd cdmoj
#cd /home/$USER/CD-MOJ
chmod +x install.sh
bash install.sh /cdmoj-dev/cd-moj/moj-serverside  /cdmoj-dev/cd-moj/moj-pagina 
cd ..

cp config/common.conf /cdmoj-dev/cd-moj/moj-serverside/etc/
echo "ServerName localhost" >> /etc/apache2/apache2.conf

echo "Iniciando apache2"
service apache2 start
