#!/bin/bash -x

# ================================
# Created by: Richard Barrett
# Company: Triking Services
# Date:05/19/2019
# Installation Script for Magento
# ================================

# Installation Documentation
# https://tecadmin.net/install-magento-on-ubuntu-16-04/

sudo apt install apache2 

sudo apt install php libapache2-mod-php php-mysql php-dom php-simplexml 
sudo apt install php-curl php-intl php-xsl php-mbstring php-zip php-xml

sudo apt install mysql-server

cd /var/www/html/magento2
tar xjf ~/Downloads/Magento-CE-*.tar.bz2
chown -R www-data.www-data /var/www/html/magento2
chmod -R 755 /var/www/html/magento2

mysql -u root -p

# mysql information tat needs to be created after install of mysql
# ================================================================

# Insert Required Information into mysql
# mysql> CREATE DATABASE magento2_db;
# mysql> GRANT ALL ON magento2_db.* TO magento2_usr@'localhost' IDENTIFIED BY 'password';
# mysql> FLUSH PRIVILEGES;
# mysql> quit

# Website
# http://localhost/magento2/
# ========================================================================================


# Schedule Cronjobs if required
# ==============================
# crontab -e
# */1 * * * * www-data php /var/www/html/magento2/bin/magento cron:run
# */1 * * * * www-data php /var/www/html/magento2/update/cron.php
# */1 * * * * www-data php /var/www/html/magento2/bin/magento setup:cron:run
