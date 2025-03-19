# Symfony Basic Docker Setup

This repository provides the simplest and most efficient Docker setup for running Symfony applications. It includes a Dockerfile for building the container and a Docker Compose file for easy management.

## YOU WILL NOT FIND ANY DOCKER SETUP FOR PHP SYMFONY FRAMEWORK AS SIMPLE AND EASY TO USE AS THIS 
**Author:** Destiny Diekedie
**Contact:** [Upwork](https://www.upwork.com/freelancers/~01fe13ad4d04129ce1) [LinkedIn](https://www.linkedin.com/in/destiny-diekedie/)

## Features

* **Ubuntu 20.04 base image:** Provides a stable and reliable environment.
* **PHP 8.2:** Uses the latest stable PHP version for optimal performance and features.
* **Node.js 18.18.2 and npm:** Includes Node.js and npm for frontend development.
* **Composer:** Installs Composer for dependency management.
* **Symfony CLI:** Installs the Symfony CLI for development tools.
* **Graceful shutdown:** The `entrypoint.sh` script ensures the Symfony server stops cleanly when the container is stopped.
* **Port 8001:** The Symfony server runs on port 8001, making it easy to access.
* **Volume mapping:** Maps your local `app/` directory to `/var/www/html/` in the container, allowing for seamless code changes.
* **Docker Compose:** Simplifies the process of building and running the container.
* **Timezone Set:** Sets the timezone to Africa/Lagos.

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

3.  **Place your Symfony project inside the app directory:**
    You must place your existing Symfony project inside the newly created app directory.

4.  **Build and run the Docker container:**

    ```bash
    docker-compose up --build
    ```

    This command will build the Docker image and start the container.

5.  **Access your Symfony application:**

    Open your web browser and navigate to `http://localhost:8001`.

6.  **Stop the container:**

    ```bash
    docker-compose down
    ```

## Directory Structure