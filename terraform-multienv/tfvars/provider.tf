terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "6.33.0" # terraform AWS provider version
            }
                      }


    backend "s3" {}   
}      

provider "aws" {
   region = "us-east-1"
}
