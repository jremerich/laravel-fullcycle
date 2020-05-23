FROM php:7.3.6-fpm-alpine3.9

RUN apk add bash mysql-client
RUN docker-php-ext-install pdo pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# COPY .docker/entrypoint.sh /
# RUN chmod +x /entrypoint.sh

WORKDIR /var/www
RUN rm -rf /var/www/html
COPY . /var/www

RUN ln -s public html
RUN chmod -R 777 /var/www/storage

EXPOSE 9000

# ENTRYPOINT [ "/entrypoint.sh" ]
ENTRYPOINT [ "php-fpm" ]
