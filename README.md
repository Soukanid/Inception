

# Inception 🐳

A System Administration project for 42 Network that sets up a Docker infrastructure using **Docker Compose**, **Alpine Linux**, and a specific set of rules (no external Docker images).

## 🏗 Architecture
The stack operates on a private network with three distinct containers:
1. **NGINX**: The entry point. Handles TLSv1.3 and forwards requests.
2. **WordPress + PHP-FPM**: The application server (Port 9000).
3. **MariaDB**: The database server (Port 3306).

## 🚀 Usage

**1. Configuration**
Add your domain to your host file (`/etc/hosts`):
```text
127.0.0.1   [your_login].42.fr
```

2. Commands Run the following from the root directory:
```bash
   make        # Build images and start the containers
   make stop   # Stop the containers
   make clean  # Stop and remove containers/images
   make fclean # Total reset (removes containers, images, and data volumes)
```
   
3. Access Open your browser and visit: https://[your_login].42.fr

Note: Database and Website data are persistent and stored in /home/[your_login]/data.
