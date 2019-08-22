FROM php:7.2-fpm-alpine AS production

RUN apk add --update --no-cache bash git make

RUN curl -sS https://get.symfony.com/cli/installer | bash

RUN git config --global user.email "you@example.com" && \
    git config --global user.name "Your Name"

# ---

FROM production AS development

# ---

FROM development AS debug

RUN apk add --update --no-cache gcc libc-dev autoconf && \
    pecl install xdebug && \
    echo "zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20170718/xdebug.so" > /usr/local/etc/php/conf.d/xdebug.ini

