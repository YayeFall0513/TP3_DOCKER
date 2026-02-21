
#Base officielle php + apache
FROM php:8.2-apache

#• Installation des extensions PHP nécessaires

RUN docker-php-ext-install pdo pdo_mysql mysqli

# Activation du module Apache mod_rewrite

RUN a2enmod rewrite

#• copier de la configuration prsonalisée de Apache

COPY docker/apache/vhost.conf /etc/apache2/sites-available/000-default.conf
# Copier les fichiers du projet dans le conteneur

COPY src/ /var/www/html

# Donner les bons droits

RUN chown -R www-data:www-data /var/www/html