FROM ubuntu:25.04

<<<<<<< HEAD
# .env file setup begins
ARG NVM_VERSION
ARG PHP_VERSION
ARG NODE_VERSION
ARG TIMEZONE
ARG PORT

ENV NVM_VERSION=${NVM_VERSION}
ENV PHP_VERSION=${PHP_VERSION}
ENV NODE_VERSION=${NODE_VERSION}
ENV TIMEZONE=${TIMEZONE}
ENV PORT=${PORT}
# .env file setup ends


# Set timezone
ENV TZ="$TIMEZONE"
=======
# Set timezone
ENV TZ=$TIMEZONE
>>>>>>> 3b100502a7b11542d0d923f86bf113b5afa30e81

# Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

RUN dpkg -l | grep php | tee packages.txt

<<<<<<< HEAD
RUN apt-get update && apt-get install -y wget software-properties-common curl zip unzip bash sudo ca-certificates git-all dos2unix

# Install nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v$NVM_VERSION/install.sh | bash
=======
RUN apt-get update && apt-get install -y wget software-properties-common curl zip unzip bash sudo ca-certificates git-all

# Install nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
>>>>>>> 3b100502a7b11542d0d923f86bf113b5afa30e81

# Activate nvm in the current shell
ENV NVM_DIR=/root/.nvm
RUN . "$NVM_DIR/nvm.sh"

# Install specific Node.js and npm versions
<<<<<<< HEAD
RUN . "$NVM_DIR/nvm.sh" && nvm install $NODE_VERSION
RUN . "$NVM_DIR/nvm.sh" && nvm use $NODE_VERSION
RUN . "$NVM_DIR/nvm.sh" && nvm alias default $NODE_VERSION && node -v && npm -v

RUN add-apt-repository -y ppa:ondrej/php

RUN apt-get install -y  php$PHP_VERSION php$PHP_VERSION-cli php$PHP_VERSION-bz2 php$PHP_VERSION-curl php$PHP_VERSION-mbstring php$PHP_VERSION-intl php$PHP_VERSION-ctype php$PHP_VERSION-iconv php$PHP_VERSION-simplexml php$PHP_VERSION-tokenizer php$PHP_VERSION-mcrypt php$PHP_VERSION-pdo php$PHP_VERSION-mysql php$PHP_VERSION-pgsql php$PHP_VERSION-sqlite3 php$PHP_VERSION-odbc
=======
RUN . "$NVM_DIR/nvm.sh" && nvm install 18.18.2 
RUN . "$NVM_DIR/nvm.sh" && nvm use 18.18.2
RUN . "$NVM_DIR/nvm.sh" && nvm alias default 18.18.2 && node -v && npm -v

RUN add-apt-repository -y ppa:ondrej/php

RUN apt-get install -y  php8.2 php8.2-cli php8.2-bz2 php8.2-curl php8.2-mbstring php8.2-intl php8.2-ctype php8.2-iconv php8.2-simplexml php8.2-tokenizer php8.2-mcrypt
>>>>>>> 3b100502a7b11542d0d923f86bf113b5afa30e81

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN wget -qO- https://get.symfony.com/cli/installer | bash && mv /root/.symfony5/bin/symfony /usr/local/bin/symfony 

RUN rm -rf /var/www/html/{*,.*}

COPY entrypoint.sh /docker/entrypoint.sh
COPY .env /docker/.env

<<<<<<< HEAD
RUN dos2unix /docker/entrypoint.sh
RUN dos2unix /docker/.env

RUN chmod +x /docker/entrypoint.sh
RUN chmod +x /docker/.env
=======
RUN chmod +x /docker/entrypoint.sh
>>>>>>> 3b100502a7b11542d0d923f86bf113b5afa30e81

WORKDIR /var/www/html/

EXPOSE $PORT

CMD ["/docker/entrypoint.sh"]