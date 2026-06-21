variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-2"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "ami_id" {
  description = "Ubuntu 22.04 LTS AMI ID (Verify for your region)"
  type        = string
  default     = "ami-0199ac7c9fbf9ed83" # Update this to a valid Ubuntu AMI in your region
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro" # Free tier eligible
}

variable "key_name" {
  description = "Name of the AWS SSH key pair"
  type        = string
  default     = "demo"
}

variable "my_ip" {
  description = "Your public IP address with /32 CIDR (e.g., 203.0.113.50/32) for secure SSH access"
  type        = string
  default     = "0.0.0.0/0" # Change this to your actual IP for better security!
}