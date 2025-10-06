layout: post
toc: true
title: AWS Deployment Reverse Proxy
description: Learn how to deploy a Docker container on AWS using a reverse proxy
categories: [Deployment]
menu: nav/CSA_Units/frqs/aws_per3.html
permalink: /devops/aws-docker-deployment/part3
---

# AWS Docker Deployment - Part 3
## Deploying Applications and Configuring Nginx
This notebook focuses on deploying web applications using Docker and configuring Nginx as a reverse proxy.

## Deploying a Web Application with Docker
Clone the project repository and deploy it using Docker Compose.


```python

# Clone and deploy a web application
!cd /deployments && git clone https://github.com/example/mybackend.git
!cd /deployments/mybackend && docker-compose up -d --build
    
```

## Configuring Nginx as a Reverse Proxy
Edit the Nginx configuration file to link the application to a domain name.


```python

# Navigate to Nginx configuration directory
!cd /etc/nginx/sites-available && sudo touch myproject

# Open the configuration file and add the following:
!echo 'server {
    listen 80;
    server_name example.stu.nighthawkcodingsociety.com;
    location / {
        proxy_pass http://localhost:8000;
    }
}' | sudo tee /etc/nginx/sites-available/myproject
    
```

After editing the configuration file, activate it with:


```python

# Enable the configuration and restart Nginx
!sudo ln -s /etc/nginx/sites-available/myproject /etc/nginx/sites-enabled/
!sudo nginx -t  # Test configuration
!sudo systemctl restart nginx
    
```

## Securing the Website with Certbot
Use Certbot to generate an SSL certificate and enable HTTPS.


```python
!sudo certbot --nginx
```

If the certificate is successfully installed, your site will be accessible over HTTPS.
