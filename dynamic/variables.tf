variable "ingress_rules" {
    type = list 
    default = [
       { 
        port = 22
        cidr_blocks = ["0.0.0.0/0"]
        description = "allow all ports from 22"
       },
      { 
        port = 443
        cidr_blocks = ["0.0.0.0/0"]
        description = "allow all ports from 443"
       },
      { 
        port = 22
        cidr_blocks = ["0.0.0.0/0"]
        description = "allow all ports from 22"
       }    
    ]
}


variable "instances" {
  type = list
  default = ["mangodb" , "reddis"]
}
