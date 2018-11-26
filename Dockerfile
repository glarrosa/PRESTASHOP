FROM ubuntu:18.04
RUN apt-get update && apt-get -y upgrade
#Instalar APACHE

RUN apt install -y apache2

#Habilitar Apache mod_rewrite
RUN ae2nmod rwerite
RUN systemctl restart apache2

#Instalar PHP
RUN apt install php-cli php-common php-mbstring php-gd php-intl php-xml php-mysql php-zip php-curl php-xmlrpc

#Instalar Prestashop
RUN cd /var/www/html
RUN wget https://download.prestashop.com/download/releases/prestashop_1.7.2.1.zip
RUN unzip prestashop_1.7.2.1.zip
RUN rm index.html

#ASIGNAR PERMISOS PRESTASHOP
RUN chown -R 755 /var/www/html

EXPOSE 80

