# Web Server (Public Subnet)
resource "aws_instance" "web_server" {
  ami                  = var.ami_id
  instance_type        = var.instance_type
  subnet_id            = aws_subnet.public_subnet.id
  key_name             = var.key_name
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  tags = {
    Name = "travelmemory-web-server"
  }
}

# Database Server (Private Subnet)
resource "aws_instance" "db_server" {
  ami                  = var.ami_id
  instance_type        = var.instance_type
  subnet_id            = aws_subnet.private_subnet.id
  key_name             = var.key_name
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  tags = {
    Name = "travelmemory-db-server"
  }
}