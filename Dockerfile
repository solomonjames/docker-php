# Pull base image.
FROM ubuntu:bionic

ARG PHP_VERSION=php7.2
ENV PHP_VERSION ${PHP_VERSION}
ENV LIB_ROOT /var/src

RUN apt-get update -qq \
    && apt-get install -yqq \
        software-properties-common \
        gnupg

# Add sources for all PHP versions
RUN ["bash", "-c", "echo \"deb http://ppa.launchpad.net/ondrej/php/ubuntu bionic main\" >> /etc/apt/sources.list"]
RUN ["bash", "-c", "echo \"deb-src http://ppa.launchpad.net/ondrej/php/ubuntu bionic main\" >> /etc/apt/sources.list"]
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E5267A6C

RUN apt-get update -qq

RUN apt-get install -yqq \
    curl \
    zip \
    unzip \
    wget

RUN apt-get install -yqq \
    "$PHP_VERSION-cli"

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

