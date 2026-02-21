variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
}

variable "tag_vars" {
    type = map
    default = {         
       Name = "terraform"
       Project = "roboshop"
       Terraform = true
       Environment = "Dev"                
              }
  }

 variable "sg_name" {
    type = string
    default = "allow_all_terraform-default"
} 

variable "sg_desc" {
    type = string
    default = "Allow TLS inbound traffic and all outbound traffic"
}

variable "sg_from_port" {
    type = number
    default = 0  
}

variable "sg_to_port" {
    type = number
    default = 0  
}

variable "cidr_blocks" {
    type = list
    default = ["0.0.0.0/0"]
}

variable "sg_tag_vars" {
    type = map
    default = { 
       Name = "allow_all_terraform"
       Project = "roboshop"
       Terraform = true
       Environment = "Dev"
             
    }
  }