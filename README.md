# cloud_helper

This repository contains various useful software setups that can be easily deployed on free cloud instances. It aims to provide a collection of tools and services that can help you maximize the utility of cloud resources.

## Available Services

- **WireGuard VPN**: Secure and fast VPN setup using Docker Compose.
- **Cockpit**: A web-based graphical interface for managing servers.


### WireGuard VPN
+ Remember to forward the port from the vps.
Navigate to the `wireguard` directory and follow the instructions in the `README.md` file to set up the WireGuard VPN using Docker Compose.

### Cockpit 

+ Access the ui on localhost:9090
Ready to deploy like that.


**Ensure Docker and Docker Compose are Installed:**
```bash
# Run the script to install docker
./install_docker.sh

# Deploy the containers
docker compose up -d
```

