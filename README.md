# Symfony Basic Docker Setup with Symfony CLI tool

This repository provides the simplest and most efficient Docker setup for running Symfony application in dev environment. It includes a Dockerfile for building the container, a Docker Compose file for easy management, and a shell script to start and stop the Symfony server.

* **dev:** This setup is for development purpose only. For production environment, use Apache or any other recommended server to run your Symfony application.

## YOU WILL NOT FIND ANY DOCKER SETUP FOR PHP SYMFONY FRAMEWORK AS SIMPLE AND EASY TO USE AS THIS 
**Author:** Destiny Diekedie
**Contact:** [LinkedIn](https://www.linkedin.com/in/destiny-diekedie/)

## Features

* **.env file:** Comes with a .env file to allow you customize the setup to your requirement.
* **Latest Ubuntu Version 25.04 base image:** Provides a stable and reliable environment.
* **PHP 8.4:** Uses the latest stable PHP version for optimal performance and features.
* **Node.js 23.11.0, NVM 0.39.7  and npm:** Includes Node.js, NVM and NPM for frontend development.
* **Composer:** Installs Composer for dependency management.
* **Symfony CLI:** Installs the Symfony CLI for development tools.
* **Graceful shutdown:** The `entrypoint.sh` script ensures the Symfony server stops cleanly when the container is stopped.
* **Port 8000:** The Symfony server runs on port 8000, making it easy to access.
* **Volume mapping:** Maps your local `app/` directory to `/var/www/html/` in the container, allowing for seamless code changes.
* **Docker Compose:** Simplifies the process of building and running the container.
* **Timezone Set:** Sets the timezone to where ever you want. The default timezone is set to Africa/Lagos in the .env file

## Prerequisites

* Docker installed on your system.
* Docker Compose installed on your system.

## Getting Started

1.  **Clone the repository:**

    ```bash
    git clone <your-repository-url>
    cd <repository-directory>
    ```

2.  **Create your Symfony project directory:**

    Create an `app` directory in the root of your project. This directory will be mounted into the Docker container.

    ```bash
    mkdir app
    ```

3.  **Place your Symfony project inside the app directory or Leave the app directory empty:**
    You can leave the app directory empty or place your existing Symfony project inside the newly created app directory.
    In case you left the app directory empty, make sure to restart the container or symfony server after installing a new Symfony project. The Symfony CLI tool will not restart the server for you.

4.  **Build and run the Docker container:**

    ```bash
    docker-compose up --build
    ```

    This command will build the Docker image and start the container.

5.  **Access your Symfony application:**

    Open your web browser and navigate to `http://localhost:8000`.

6.  **Stop the container:**

    ```bash
    docker-compose down
    ```

## Directory Structure