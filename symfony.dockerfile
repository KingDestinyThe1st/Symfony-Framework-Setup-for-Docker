FROM ubuntu:24.10

# Set timezone
ENV TZ=${TIMEZONE}

# Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

RUN dpkg -l | grep php | tee packages.txt

RUN apt-get update && apt-get install -y wget software-properties-common curl zip unzip bash sudo ca-certificates git-all

# Install nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Activate nvm in the current shell
ENV NVM_DIR=/root/.nvm
RUN . "$NVM_DIR/nvm.sh"

# Install specific Node.js and npm versions
RUN . "$NVM_DIR/nvm.sh" && nvm install 18.18.2 
RUN . "$NVM_DIR/nvm.sh" && nvm use 18.18.2
RUN . "$NVM_DIR/nvm.sh" && nvm alias default 18.18.2 && node -v && npm -v

RUN add-apt-repository -y ppa:ondrej/php

RUN apt-get install -y  php"$PHP_VERSION" php"$PHP_VERSION"-cli php"$PHP_VERSION"-bz2 php"$PHP_VERSION"-curl php"$PHP_VERSION"-mbstring php"$PHP_VERSION"-intl php"$PHP_VERSION"-ctype php"$PHP_VERSION"-iconv php"$PHP_VERSION"-simplexml php"$PHP_VERSION"-tokenizer php"$PHP_VERSION"-mcrypt

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN wget -qO- https://get.symfony.com/cli/installer | bash && mv /root/.symfony5/bin/symfony /usr/local/bin/symfony 

RUN rm -rf /var/www/html/{*,.*}

WORKDIR /var/www/html/

COPY entrypoint.sh .
COPY .env .

RUN ls -l /var/www/html/

RUN chmod +x entrypoint.sh

EXPOSE $PORT

CMD ["/entrypoint.sh"]