apt update

#-----Install utilities-----#
apt install -y zip unzip

#-----Установка Swapspace
# занимается файлом подкачки в системе
# нужен для разруливания падений по нехватке памяти
# т.к. например, Composer, довольно прожорливый, и ему не хватает 1 гига ОЗУ
#apt install -y swapspace

#-----Install PHP v7.4 with extensions-----#
add-apt-repository ppa:ondrej/php
apt update
apt install -y php7.4 php7.4-common php7.4-cli php7.4-fpm php7.4-gd php7.4-mysql php7.4-mbstring php7.4-curl php7.4-xml php7.4-zip php7.4-json php7.4-bcmath

#-----Install Composer-----#
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php --install-dir=/bin
mv /bin/composer.phar /usr/local/bin/composer
rm composer-setup.php

#-----Install NodeJS v12.x with NPM v6.x-----#
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
apt install -y nodejs

#-----Install MySQL v8.0-----#
export DEBIAN_FRONTEND="noninteractive"
debconf-set-selections <<< "mysql-apt-config mysql-apt-config/unsupported-platform select abort"
debconf-set-selections <<< "mysql-apt-config mysql-apt-config/tools-component select mysql-tools"
debconf-set-selections <<< "mysql-apt-config mysql-apt-config/select-preview select Disabled"
debconf-set-selections <<< "mysql-apt-config mysql-apt-config/repo-distro select ubuntu"
debconf-set-selections <<< "mysql-apt-config mysql-apt-config/select-product select Ok"
debconf-set-selections <<< "mysql-apt-config mysql-apt-config/select-server select mysql-8.0"
debconf-set-selections <<< "mysql-apt-config mysql-apt-config/select-tools select Enabled"
debconf-set-selections <<< "mysql-apt-config mysql-apt-config/repo-codename select bionic"
debconf-set-selections <<< "mysql-apt-config mysql-apt-config/repo-url string http://repo.mysql.com/apt"
debconf-set-selections <<< "mysql-community-server mysql-community-server/re-root-pass password root"
debconf-set-selections <<< "mysql-community-server mysql-community-server/root-pass password root"
debconf-set-selections <<< "mysql-community-server mysql-community-server/remove-data-dir select false"
wget -c https://dev.mysql.com/get/mysql-apt-config_0.8.14-1_all.deb
dpkg -i mysql-apt-config_0.8.14-1_all.deb
apt update
apt install -y mysql-server
rm mysql-apt-config_0.8.14-1_all.deb

#-----Install Nginx with basic config-----#
apt install -y nginx
cp -f /var/www/project/Vagrant/nginx.conf /etc/nginx/nginx.conf
cp -f /var/www/project/Vagrant/project.conf /etc/nginx/conf.d/project.conf
nginx -s reload

#-----Установка зависимостей проекта
# устанавливаем с помощью Composer необходимые для Laravel (и проекта) библиотеки
# даем права на владение папкой проекта веб-серверу, чтобы мог создавать/перезаписывать файлы
#cd /var/www/eventris
#cp ./.env.example ./.env
#composer install --no-scripts
#chown -R www-data:www-data /var/www/eventris/
