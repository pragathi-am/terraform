locals {
   instance_name = "${var.name}-${var.environment}" 
   common_tags = {
    Project = "roboshop"
    terraform = true
    environment = "dev"
   }
   ec2_final_tags = merge(local.common_tags, var.ec2_tags)
   ami_id = "ami-0220d79f3f480ecf5"
}