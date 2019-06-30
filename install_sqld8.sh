#!/bin/bash
#script by SCRK d9
#install lamp

printf 'ตั้งรหัสผ่าน: '
read password


apt-get remove --purge mysql-server php-mysql -y
apt-get autoremove --purge -y
apt-get autoclean
  echo ""
  echo "BY:SCK"
  echo ""
rm -rf /etc/mysql
find / -iname 'mysql*' -exec rm -rf {} \;

apt-get update

#install mysql
export DEBIAN_FRONTEND=noninteractive
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password '$password
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password '$password
sudo apt-get -y install mysql-server

echo "GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY '"$password"' WITH GRANT OPTION;" > my.sql
mysql < my.sql

#Install php 7.3
apt update 

apt upgrade
 echo ""
 echo
 echo ""
apt install ca-certificates apt-transport-https 

wget -q https://packages.sury.org/php/apt.gpg -O- | sudo apt-key add -
echo "deb https://packages.sury.org/php/ stretch main" | tee /etc/apt/sources.list.d/php.list

#INSTALL PHP

apt update

apt install php7.3

apt install php7.3-cli php7.3-common php7.3-curl php7.3-mbstring php7.3-mysql php7.3-xml
    echo ""
    echo "SCK SCRIPT"
    echo ""