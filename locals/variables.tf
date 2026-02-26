variable "name" {
    type = string
    default = "locals"  
}

variable "environment" {
    type = string
    default = "dev"  
}

/* variable "instance-name" {
    type = string
    default = "${var.name}-${var.environment}" 
} */

variable "ec2_tags" {
     default = {
        Name = "functions-demo"
        environment = "Prod"
     }
}