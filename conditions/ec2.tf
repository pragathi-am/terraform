resource "aws_instance" "example" {
  ami           = var.ami_id
  vpc_security_group_ids = [ aws_security_group.allow_tls.id ]

  # if environment is dev then "t3.micro" else "t3.small"
  instance_type = var.environment == "dev" ? "t3.micro" : "t3.small"

  tags = var.tag_vars
}

resource "aws_security_group" "allow_tls" {
  name        = var.sg_name
  description = var.sg_desc

  egress {
    from_port        = var.sg_from_port
    to_port          = var.sg_to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = var.sg_from_port
    to_port          = var.sg_to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }
  
  tags = var.sg_tag_vars
     
}