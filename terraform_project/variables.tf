variable "aws_region" {
  type    = string
  default = "ap-south-2"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  type    = string
  default = "10.0.2.0/24"
}

variable "instance_type" {
  type    = string
  default = "t3.micro" 
}

variable "my_ip" {
  type        = string
  description = "EC2 Public IP"
}

variable "key_name" {
  type        = string
  description = "The name of your pre-existing AWS Key Pair"
}