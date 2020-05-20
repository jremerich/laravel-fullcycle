#!/bin/bash

cp .env.example ./.env

sed -i "s/^DB_HOST=127.0.0.1$/DB_HOST=$DB_HOST/" ./.env
sed -i "s/^DB_DATABASE=laravel$/DB_DATABASE=$DB_DATABASE/" ./.env
sed -i "s/^DB_USERNAME=root$/DB_USERNAME=$DB_USERNAME/" ./.env
sed -i "s/^DB_PASSWORD=$/DB_PASSWORD=$DB_PASSWORD/" ./.env
sed -i "s/^REDIS_HOST=127.0.0.1$/REDIS_HOST=$REDIS_HOST/" ./.env

composer install
php artisan key:generate
php artisan migrate
php-fpm
