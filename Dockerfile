FROM php:7.4-fpm-alpine

# Install Make
RUN apk add gcc g++ make autoconf git imagemagick-dev pkgconfig

#Install Imagick
RUN pecl install imagick && docker-php-ext-enable imagick

# Install Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN ln -s /var/www/html/composer.phar /usr/bin/composer

# Install NPM
RUN apk add nodejs npm

# Install Rsync and OpenSSH
RUN apk add rsync openssh

# Install Python 2.7
RUN apk add python

# Clear
RUN docker-php-source delete && rm -rf /tmp/* /var/cache/apk/*

CMD ["php-fpm"]