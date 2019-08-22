FROM php:7.2-fpm-alpine

RUN apk add --update --no-cache bash git make

RUN curl -sS https://get.symfony.com/cli/installer | bash

RUN git config --global user.email "you@example.com" && \
    git config --global user.name "Your Name"

