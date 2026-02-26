resource "aws_instance" "example" {
  ami           = "ami-0220d79f3f480ecf5"
  vpc_security_group_ids = [ aws_security_group.allow_tls.id ]
  instance_type = "t3.micro"

  provisioner "local-exec" {
    command = "echo '${self.public_ip}' > inventory.ini "
    on_failure = continue
    }
   connection {
      type = "ssh"
      user = "ec2-user"
      password = "DevOps321"
      host = self.public_ip
   }
  provisioner "remote-exec" {
   inline = [
       "sudo dnf install nginx -y",
       "sudo systemctl start nginx"
   ]
  }
  provisioner "remote-exec" {
   inline = [
       "sudo systemctl stop nginx"
   ]
   when = destroy
  }  
  
  tags = {
    Name = "provisioners-demo"
    Project = "roboshop"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_all_terraform-prov"
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