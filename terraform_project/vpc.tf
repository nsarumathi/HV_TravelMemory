# 1. Create the VPC
resource "aws_vpc" "travelmemory_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "travelmemory-vpc"
  }
}

# 2. Create Public Subnet (For React frontend / Node backend)
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.travelmemory_vpc.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = "${var.aws_region}a"

  tags = {
    Name = "travelmemory-public-subnet"
  }
}

# 3. Create Private Subnet (For MongoDB Database)
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.travelmemory_vpc.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = "${var.aws_region}b"

  tags = {
    Name = "travelmemory-private-subnet"
  }
}

# 4. Internet Gateway (Allows public subnet to talk to the internet)
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.travelmemory_vpc.id

  tags = {
    Name = "travelmemory-igw"
  }
}

# 5. Elastic IP for NAT Gateway
resource "aws_eip" "nat_eip" {
  domain     = "vpc"
  depends_on = [aws_internet_gateway.igw]
}

# 6. NAT Gateway (Allows private DB to download updates from internet safely)
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet.id # NAT gateway must live in the public subnet

  tags = {
    Name = "travelmemory-nat-gw"
  }
}

# 7. Route Table for Public Subnet
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.travelmemory_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "travelmemory-public-rt"
  }
}

# 8. Route Table for Private Subnet
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.travelmemory_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name = "travelmemory-private-rt"
  }
}

# 9. Associate Public Subnet with Public Route Table
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

# 10. Associate Private Subnet with Private Route Table
resource "aws_route_table_association" "private_assoc" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_rt.id
}