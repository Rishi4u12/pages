---
layout: post
toc: true
title: AWS Deployment - Launch EC2 
description: Setting up an EC2 instance on AWS 
categories: [DevOps]
menu: nav/CSA_Units/frqs/aws_per3.html
courses: { cloud: {week: 11} }
type: tutorial
permalink: /devops/aws-docker-deployment/part1
---

# AWS Deployment - Part 1
## Introduction and Setting Up AWS EC2
This notebook provides an overview of AWS EC2 deployment, including setting up instances, connecting to them, and configuring security settings.

## Understanding AWS EC2
Amazon Elastic Compute Cloud (EC2) is a service that provides scalable computing resources in the cloud. It allows developers to deploy applications efficiently.

### Benefits of AWS EC2
- **Rapid Deployment**: Instances can be set up within minutes.
- **Pay-as-you-go Pricing**: Costs are based on actual usage.
- **Scalability**: Easily scale applications based on demand.

## Accessing AWS EC2 Instances
To access AWS EC2 instances, log into the [AWS Console](https://aws.amazon.com/console/). You will be prompted to enter your credentials.

For this example, we use the NighthawkCodingSociety AWS organization.

![AWS Console Login](https://rackets-assets.vercel.app/assets/deployment_lesson/Deployment_AWS_Page_1.png)

### Selecting the AWS Region
Make sure to change the default region to **US East (Ohio)** to ensure proper connectivity.

![Select AWS Region](https://rackets-assets.vercel.app/assets/deployment_lesson/Deployment_AWS_Page_4.png)

### Navigating to EC2 Dashboard
Once logged in, navigate to the EC2 dashboard by searching for **EC2** in the AWS search bar.

![EC2 Dashboard](https://rackets-assets.vercel.app/assets/deployment_lesson/Deployment_AWS_Page_5.png)

### Viewing and Launching Instances
Click on **Instances** in the EC2 dashboard to view running instances. If launching a new instance, select **Launch Instance**, choose **Ubuntu 22.04 LTS**, and configure security settings.

![AWS Instance Selection](https://rackets-assets.vercel.app/assets/deployment_lesson/Deployment_AWS_Page_7.png)

### Connecting to an Instance
To connect to an instance, select it and click **Connect**. Use **EC2 Instance Connect** (default option) to access the server via terminal.

![EC2 Instance Connect](https://rackets-assets.vercel.app/assets/deployment_lesson/Deployment_AWS_Page_8.png)

Once connected, you will have access to the command line:

![EC2 Terminal](https://rackets-assets.vercel.app/assets/deployment_lesson/Deployment_AWS_Page_9.png)
