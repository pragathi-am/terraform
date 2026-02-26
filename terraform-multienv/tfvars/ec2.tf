resource "aws_instance" "example" {
  ami           = "ami-0220d79f3f480ecf5"
  vpc_security_group_ids = [ aws_security_group.allow_tls.id ]
  instance_type = var.instance_type

  tags = {
    Name = "terraform-${var.environment}"
    Project = "roboshop"
    Environment = var.environment
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_all_terraform-${var.environment}"
  description = "Allow TLS inbound traffic and all outbound traffic"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  
  tags = {
    Name = "allow_all_terraform-${var.environment}"
  }
}