resource "aws_instance" "example" {
  #for_each = var.instances  ==> this is for map exmple
   for_each = toset(var.instances) # this is list and to user for_each we hve to conver to set
  ami           = "ami-0220d79f3f480ecf5"
  vpc_security_group_ids = [ aws_security_group.allow_tls.id ]
  instance_type = "t3.micro"
  tags = {
    Name = each.key
    Project = "roboshop"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_all_terraform"
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
    Name = "allow_all_terraform"
  }
}