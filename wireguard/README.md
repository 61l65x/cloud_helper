# WireGuard VPN Deployment Guide

This guide provides step-by-step instructions to deploy a WireGuard VPN service using Docker Compose.

### Prerequisites

Ensure your Oracle Cloud instance is up-to-date and Docker is installed.

## Port Forwarding
Remember to forward port 51820 in your Cloud instance's security settings to allow external access to your WireGuard VPN.

## Setup 
1. **Update your system packages:**

    ```bash
    sudo apt update
    sudo apt upgrade -y
    ```

2. **Install Docker:**

    ```bash
    sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt update
    sudo apt install -y docker-ce
    ```

3. **Install Docker Compose:**

    ```bash
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    docker-compose --version
    ```

4. **Add your user to the Docker group:**

    ```bash
    sudo usermod -aG docker $USER
    newgrp docker
    ```

### Deployment

1. **Navigate to the deployment directory:**

    ```bash
    cd ~/cloud_helper/wireguard
    ```

2. **Create a `.env` file with the necessary environment variables:**

    ```bash
    echo "PUID=1000
    PGID=1000
    TZ=Etc/UTC
    PUBLIC_IP=$(curl -s checkip.amazonaws.com)
    SERVERPORT=51820
    PEERS=1
    PEERDNS=auto" > .env
    ```

3. **Start the WireGuard service:**

    ```bash
    docker-compose up -d
    ```

### Retrieving Client Configuration

Once the service is running, the client configuration file can be found in the `config` directory.

1. **List the configuration files:**

    ```bash
    ls ./config/peer1
    ```

2. **Download the `peer1.conf` file to your local machine to configure your VPN client.**

6. **Start the WireGuard service:**

    ```bash
    docker-compose up -d
    ```

7. **List the configuration files:**

    ```bash
    ls ./config/peer1
    ```

8. **Download the `peer1.conf` file to your local machine to configure your VPN client.**

