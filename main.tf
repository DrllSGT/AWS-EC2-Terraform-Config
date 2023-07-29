variable "test_ip_address" {
  type = string
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_vpc" "test_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "test_vpc"
  }
}

resource "aws_internet_gateway" "test_igw" {
  vpc_id = aws_vpc.test_vpc.id

  tags = {
    Name = "test_igw" 
  }
}

resource "aws_subnet" "test_subnet" {
  vpc_id     = aws_vpc.test_vpc.id
  cidr_block = "10.0.1.0/22"

  tags = {
    Name = "test_subnet"
  }
}

resource "aws_security_group" "test_sg" {
  name        = "test_sg"
  vpc_id      = aws_vpc.test_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.test_ip_address}/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0 
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "test_instance" {
  ami           = "ami-0c44b239cbfafe2f9" 
  instance_type = "t3.small"
  subnet_id     = aws_subnet.test_subnet.id
  vpc_security_group_ids = [aws_security_group.test_sg.id]

  tags = {
    Name = "test_instance"
  }
}
