FROM php:8.2-apache

# Enable .htaccess rewrites if your repo uses them
RUN a2enmod rewrite headers \
 && sed -ri 's!AllowOverride None!AllowOverride All!g' /etc/apache2/apache2.conf

WORKDIR /var/www/html
