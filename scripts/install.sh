#!/bin/bash

echo "-----Bem vindo ao instalador do CD-MOJ!-----"
sleep 3

echo "-----Criando pastas-----"

cd cdmoj
chmod a+rwx cdmoj

mkdir $HOME/log
mkdir -p tmp moj moj/submissions moj/contests
cp -r examples/* moj/contests/

chmod o+w moj/submissions
chmod o+w tmp

echo "-----Clonando repositorio do cdmoj-----"

git clone https://github.com/cd-moj/cdmoj.git cd-moj
git pull origin
(
cd cd-moj || exit
chmod +x install.sh
bash install.sh /cdmoj/moj-serverside  /cdmoj/moj-pagina 
)
cp config/common.conf /cdmoj/moj-serverside/etc/
rm -rf cd-moj

echo "Substituindo arquivos"
cp config/apache2.conf /etc/apache2/
cp config/moj.conf /etc/apache2/sites-available/
cp config/serve-cgi-bin.conf /etc/apache2/conf-available/

echo "Configurando apache2"
ln -s etc/apache2/mods-available/cgi.load /etc/apache2/mods-enabled/cgi.load
a2dissite 000-default
a2ensite moj
a2enmod include

echo "ServerName localhost" >> /etc/apache2/apache2.conf

rm -rf config/
rm -rf examples/
rm install.sh
