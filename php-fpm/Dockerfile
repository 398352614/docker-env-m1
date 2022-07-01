FROM php:8.1.0RC5-fpm-buster

COPY ./sources.list.buster /etc/apt/sources.list

RUN apt-get update \
    && apt-get install -y \
        sudo \
        vim \
        curl \
        wget \
        git \
        zip \
        net-tools \
        procps \
        libz-dev \
        libssl-dev \
        libnghttp2-dev \
        libpcre3-dev \
        libmemcached-dev \
        zlib1g-dev \
    && apt-get clean

RUN apt-get update \
  && apt-get install -y --no-install-recommends libpq-dev \
  && docker-php-ext-install mysqli pdo_pgsql pdo_mysql pcntl bcmath

RUN apt-get install -y supervisor

#安装redis扩展
RUN pecl install -o -f redis \
&&  rm -rf /tmp/pear \
&&  docker-php-ext-enable redis

#将宿主机的supervior复制到容器中
COPY ./supervisor /etc/supervisor/conf.d
RUN rm -rf /etc/supervisor/logs
RUN mkdir /etc/supervisor/logs

#composer安装
RUN wget https://mirrors.aliyun.com/composer/composer.phar -O /usr/bin/composer
RUN chmod +x /usr/bin/composer

#将宿主机的php配置复制到容器中
COPY ./php.ini /usr/local/etc/php/conf.d/php.ini

#COPY ./supervisord.conf /etc/supervisor/supervisord.conf
#CMD ["sh","-c","supervisord -c /etc/supervisor/supervisord.conf  && tail -f /dev/null"]

WORKDIR /var/www/html/api-ds

