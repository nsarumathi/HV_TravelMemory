# MERN Application Deployment on AWS using Terraform & Ansible

Project Overview
-----------------
This project demonstrates Infrastructure as Code (IaC) and Configuration Management by deploying the TravelMemory MERN Application on AWS using Terraform and Ansible.

Assignment Objectives:
------------------------------------
Part 1 – Infrastructure Setup using Terraform

    AWS CLI Configuration
    Terraform Initialization
    VPC Creation
    Public and Private Subnets with  Route Tables association
    Internet Gateway & NAT Gateway  Configuration
    Security Groups
    IAM Roles
    EC2 Instance Provisioning (Web EC2 Server & DB EC2 Server)
    Output Web Server Public IP & DB Private IP

Part 2 – Configuration Management using Ansible

    Ansible Inventory Configuration
    Node.js & NPM Installation
    Application Repository Cloning
    Dependency Installation
    MongoDB Installation and Configuration
    Environment Variable Configuration
    Application Deployment
    Security Hardening

Architecture:
----------------------------
<img width="316" height="516" alt="image" src="https://github.com/user-attachments/assets/903838b6-b08f-4d83-ac11-cd06986493bc" />

Execution Steps
-----------------------------
Step 1 : Create a Practice EC2 Instance.

<img width="1717" height="697" alt="EC2_creation" src="https://github.com/user-attachments/assets/f30121a0-ac9e-4cb9-8a99-1a4232edda2e" />

Step 2 : Install required tools in Pratice EC2 Instance to run terraform & ansible configuration
    AWS CLI
    Terraform
    Ansible
    Tree
    
<img width="1582" height="547" alt="Dependencies" src="https://github.com/user-attachments/assets/55ce068c-888d-482b-9600-b930f3885600" />

Step 3 :Configure AWS CLI & Upload ssh Key

<img width="1617" height="852" alt="terraform_troubleshoot_awsconfigure" src="https://github.com/user-attachments/assets/b6e4da34-fb1d-44a1-afa0-383237376b55" />

Step 4 :Create Terraform Workspace & configure terraform files

<img width="1050" height="831" alt="terraform_dir" src="https://github.com/user-attachments/assets/aed97f9f-8a0f-4e79-abe7-c73b952e6d8f" />


Step 5: Deploy Infrastructure using terraform commands

<img width="1320" height="852" alt="terraform_apply" src="https://github.com/user-attachments/assets/70cebad8-7596-4b00-82ad-b493e3386a8a" />
<img width="1617" height="852" alt="terraform_troubleshoot_awsconfigure" src="https://github.com/user-attachments/assets/b6e4da34-fb1d-44a1-afa0-383237376b55" />

Step 6 :Terraform Resources created

Web_EC2 with securirty group:

<img width="1722" height="802" alt="2_EC2" src="https://github.com/user-attachments/assets/1f32eccc-367b-4726-9da4-5a494a7408fa" />
<img width="1722" height="685" alt="web_securitygp" src="https://github.com/user-attachments/assets/445721df-bd8d-48cd-b799-b6f577a87b56" />

DB_EC2 with security group:

<img width="1692" height="756" alt="db_ec2" src="https://github.com/user-attachments/assets/140e24ad-2378-49c6-89e5-d946b47c1f0e" />
<img width="1722" height="565" alt="db_securitygp" src="https://github.com/user-attachments/assets/845acf18-bbad-471d-b2ab-c9c7a8895668" />

VPC:
<img width="1711" height="662" alt="vpc" src="https://github.com/user-attachments/assets/b348602e-67f8-47a2-9697-01efd1868e70" />

Step 7 :Create Ansible Workspace with Deployment approaches

1.MongoDB hosted on Private EC2 Database Server

<img width="1620" height="882" alt="ansibleping_v1" src="https://github.com/user-attachments/assets/b1d21f28-3682-44ac-ab4e-d655640c4643" />

2.MongoDB Atlas Cloud Database

<img width="1617" height="887" alt="ansible_v2_modbatlas" src="https://github.com/user-attachments/assets/8a379c19-a467-4d14-a126-68b53d1894f1" />

Step 8 : Run Ansible Playbooks

Deployment 1:
<img width="1621" height="882" alt="ansible_Deploy_v1" src="https://github.com/user-attachments/assets/8feb3db0-7fb2-435e-b63c-1d70cbfcccd3" />

Web EC2 Connection:
<img width="1617" height="847" alt="web_ec2_check" src="https://github.com/user-attachments/assets/454fb53e-01ee-4549-a79f-8fdb35c128f7" />

DB ec2 Connection:
<img width="1617" height="847" alt="DBCheckafteransible" src="https://github.com/user-attachments/assets/3307e385-149f-43eb-b6f9-55817df7d8b7" />

Web EC2 Server Access with Mongo DB hosted in Private DB server:
<img width="1917" height="811" alt="Ansible_config_check" src="https://github.com/user-attachments/assets/58185c41-d847-4c8e-adc5-d8e51a73eeb4" />

Deployment 2:
<img width="1622" height="887" alt="ansible_appply_v2" src="https://github.com/user-attachments/assets/ca223e20-efa9-4d44-9b62-a5b8dfd1edfc" />

Web EC2 Server Access with Mongo DBAtlas:

<img width="1667" height="780" alt="DBATLAS_CHECK" src="https://github.com/user-attachments/assets/bd75e213-b00a-447a-8ed0-b84b23bfba1a" />

Security Hardening
--------------------------------------

Implemented:
  SSH access restricted to authorized IP
  Private Database Server
  Security Groups
  IAM Roles
  SSH Key Authentication
  Disabled password-based authentication
  Firewall configuration
  Restricted MongoDB access
  
Cleanup
---------------------------------------

Destroy infrastructure: terraform destroy
