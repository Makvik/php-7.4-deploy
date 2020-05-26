FROM php:7.4-fpm-alpine

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

# Install Make
RUN apk add gcc g++ make

CMD ["php-fpm"]