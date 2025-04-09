FROM ubuntu:20.04

# Set timezone
ENV TZ=Africa/Lagos 

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

RUN apt-get install -y  php8.2 php8.2-cli php8.2-bz2 php8.2-curl php8.2-mbstring php8.2-intl php8.2-ctype php8.2-iconv php8.2-simplexml php8.2-tokenizer php8.2-mcrypt

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN wget -qO- https://get.symfony.com/cli/installer | bash && mv /root/.symfony5/bin/symfony /usr/local/bin/symfony 

RUN rm -rf /var/www/html/{*,.*}

COPY entrypoint.sh /docker/entrypoint.sh

RUN chmod +x /docker/entrypoint.sh

WORKDIR /var/www/html/

EXPOSE 8000

CMD ["/docker/entrypoint.sh"]