FROM php:8.1-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
    gd \
    mysqli \
    pdo_mysql \
    zip \
    opcache

# Configure PHP
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# Configure OPcache
RUN echo "opcache.memory_consumption=128" >> /usr/local/etc/php/conf.d/opcache-recommended.ini \
    && echo "opcache.interned_strings_buffer=8" >> /usr/local/etc/php/conf.d/opcache-recommended.ini \
    && echo "opcache.max_accelerated_files=4000" >> /usr/local/etc/php/conf.d/opcache-recommended.ini \
    && echo "opcache.revalidate_freq=2" >> /usr/local/etc/php/conf.d/opcache-recommended.ini \
    && echo "opcache.fast_shutdown=1" >> /usr/local/etc/php/conf.d/opcache-recommended.ini

# Configure PHP for WordPress
RUN echo "upload_max_filesize = 64M" >> /usr/local/etc/php/conf.d/wordpress.ini \
    && echo "post_max_size = 64M" >> /usr/local/etc/php/conf.d/wordpress.ini \
    && echo "max_execution_time = 300" >> /usr/local/etc/php/conf.d/wordpress.ini \
    && echo "memory_limit = 256M" >> /usr/local/etc/php/conf.d/wordpress.ini

WORKDIR /var/www/html

# Configure www-data user
RUN chown -R www-data:www-data /var/www/html

USER www-data
