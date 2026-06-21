# ==========================
# Web Server Security Group
# ==========================

resource "aws_security_group" "web_sg" {
  name        = "travelmemory-web-sg"
  description = "Allow HTTP, App and SSH traffic"
  vpc_id      = aws_vpc.travelmemory_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3001
    to_port     = 3001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "travelmemory-web-sg"
  }
}

# ==========================
# Database Security Group
# ==========================

resource "aws_security_group" "db_sg" {
  name        = "travelmemory-db-sg"
  description = "Allow MongoDB access from Web Server"
  vpc_id      = aws_vpc.travelmemory_vpc.id

  ingress {
    from_port       = 27017
    to_port         = 27017
    protocol        = "tcp"
    security_groups = [aws_security_group.web_sg.id]
  }

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.web_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "travelmemory-db-sg"
  }
}

# ==========================
# IAM Role for EC2
# ==========================

resource "aws_iam_role" "ec2_role" {
  name = "travelmemory-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "sts:AssumeRole"

        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name = "travelmemory-ec2-role"
  }
}

# ==========================
# IAM Instance Profile
# ==========================

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "travelmemory-ec2-profile"
  role = aws_iam_role.ec2_role.name
}

# ==========================
# SSM Policy Attachment
# ==========================

resource "aws_iam_role_policy_attachment" "ssm_policy" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# ==========================
# CloudWatch Policy Attachment
# ==========================

resource "aws_iam_role_policy_attachment" "cloudwatch_policy" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}