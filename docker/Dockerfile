# run Dockerfile with image php:8.2-fpm
FROM php:8.2-fpm

# set defaut working directory url
WORKDIR /var/www

# install extention to VM
RUN apt-get update && apt-get install -y \
    libpq-dev zip unzip git curl netcat-openbsd \
    && docker-php-ext-install pdo_pgsql

# mount composer to VM
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# mount src to VM
COPY .env composer.* artisan ./
COPY app/ app/
COPY bootstrap/ bootstrap/
COPY config/ config/
COPY database/ database/
COPY public/ public/
COPY resources/ resources/
COPY routes/ routes/
COPY storage/ storage/

#mount entrypoint to VM
COPY docker/entrypoint.sh /entrypoint.sh
#set permistion for entrypoint
RUN chmod +x /entrypoint.sh

#run composer install setup
RUN composer install --no-interaction --prefer-dist --optimize-autoloader

# set user and permission for src, storage, bootstrap/cache in VM
RUN chown -R www-data:www-data /var/www \
  && chmod -R 775 /var/www/storage /var/www/bootstrap/cache

#run entrypoint
ENTRYPOINT ["/entrypoint.sh"]

CMD ["php-fpm"]
