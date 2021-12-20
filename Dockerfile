FROM ubuntu:21.10

RUN ln -fs /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
RUN apt-get update && apt-get -y install vim git sudo gcc software-properties-common valgrind curl

#Install PHP PPA, including with debug symbols
## https://github.com/oerdnj/deb.sury.org/wiki/Frequently-Asked-Questions
RUN sudo LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php

## add debug symbols to  sources
RUN echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu/ impish main/debug" >> /etc/apt/sources.list.d/ondrej-ubuntu-php-impish.list

## install php CLI with debug symbols
RUN apt-get update && apt-get -y install php7.4-cli-dbgsym
