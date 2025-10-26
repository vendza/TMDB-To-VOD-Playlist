FROM php:8.2-apache

# Enable Apache mods you need
RUN a2enmod rewrite headers

# PHP extensions commonly used by this project
RUN apt-get update && apt-get install -y \
    git unzip libxml2-dev libzip-dev \
 && docker-php-ext-install zip dom

# Keep Apache happy and quiet about ServerName
RUN printf "ServerName localhost\n" > /etc/apache2/conf-available/servername.conf \
 && a2enconf servername

# Allow .htaccess overrides (the repo ships one)
RUN sed -ri 's!<Directory /var/www/>!<Directory /var/www/>!g' /etc/apache2/apache2.conf \
 && sed -ri 's!AllowOverride None!AllowOverride All!g' /etc/apache2/apache2.conf

# DocumentRoot already /var/www/html in base image
WORKDIR /var/www/html
