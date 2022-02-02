#!/bin/bash

echo "Bem vindo ao instalador do CD-MOJ!"
sleep 3

echo "Criando pastas"
cd cdmoj-dev
chmod a+rwx cdmoj-dev
mkdir cdmoj
cd cdmoj
mkdir moj
mkdir moj/submissions
mkdir moj/contests
mkdir tmp
chmod o+w moj/submissions
chmod o+w tmp
cd ..
cp -r examples/* cdmoj/moj/contests/

echo "Clonando repositorio do cdmoj"
cd cdmoj-dev
git clone https://github.com/cd-moj/cdmoj.git cd-moj
cd cd-moj
[chmod +x install.sh]
bash install.sh /cdmoj-dev/cdmoj/moj-serverside  /cdmoj-dev/cdmoj/moj-pagina 
cd ..
cp config/common.conf /cdmoj-dev/cdmoj/moj-serverside/etc/
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

echo "Iniciando apache2"
service apache2 start

echo "Iniciando daemons"
ls 
#touch /dev/executar-corretor
#touch /dev/executar-julgador
#bash cd-moj/moj-serverside/daemons/executar-corretor.sh </dev/executar-corretor &>/dev/executar-corretor &
#bash cd-moj/moj-serverside/daemons/executar-julgador.sh </dev/executar-julgador &>/dev/executar-julgador &
#service apache2 start
