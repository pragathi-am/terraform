resource "aws_instance" "example" {
  ami           = var.ami_id
  vpc_security_group_ids = [ aws_security_group.allow_tls.id ]
  instance_type = var.instance_type

  tags = var.tag_vars
}

resource "aws_security_group" "allow_tls" {
  name        = var.sd_name
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