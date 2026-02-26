terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "6.33.0" # terraform AWS provider version
            }
                      }


    backend "s3" {
      bucket = "remote-state-88s-raga"
      key = "remote-state.tfstate"
      region = "us-east-1"
      encrypt = true
      use_lockfile = true
     }
}      

provider "aws" {
   region = "us-east-1"
}
