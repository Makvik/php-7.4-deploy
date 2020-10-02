FROM php:7.4-fpm-alpine

# Install Make
RUN apk --update add gcc \
    g++ \
    make \
    autoconf \
    git \
    imagemagick-dev \
    freetype \
    libpng \
    libjpeg-turbo \
    freetype-dev \
    libpng-dev \
    libjpeg-turbo-dev \
    pkgconfig \
    libxml2-dev \
    libzip-dev \
    python2 \
    rsync \
    openssh \
    nodejs \
    npm

# Install Zip
RUN docker-php-ext-configure zip && \
    docker-php-ext-install zip && \
    docker-php-ext-enable zip

# Install Soap
RUN docker-php-ext-install soap && \
     docker-php-ext-enable soap

# Install Exif
RUN docker-php-ext-install exif && \
     docker-php-ext-enable exif

# Install GD
RUN docker-php-ext-configure gd && \
    docker-php-ext-install gd && \
    docker-php-ext-enable gd

# Install Imagick
RUN pecl install imagick && \
    docker-php-ext-enable imagick

# Install MongoDB
RUN pecl install mongodb && \
    docker-php-ext-enable mongodb

# Install Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN ln -s /var/www/html/composer.phar /usr/bin/composer

# Clear
RUN docker-php-source delete && rm -rf /tmp/* /var/cache/apk/*

CMD ["php-fpm"]
