terraform {
  required_providers {
    aws = {
      #For more information, see the version on the Terraform registry --> https://registry.terraform.io/providers/hashicorp/aws/5.47.0
      source  = "hashicorp/aws"
      version = "5.47.0"
    }
  }
}

provider "aws" {
  //shared_credentials_files = "/Users/gibran/.aws/credentials"
  profile = "terraform_profile"
  region = "us-west-2"
}

variable "instance_count" {
    type = number
    description = "The number of EC2 instances to be managed."
    default = 3
}

resource "aws_instance" "app_server" {
  count = var.instance_count
  ami           = "ami-077ee47512dc6f3ca"
  instance_type = "t2.nano"
  tags = {
    Name = "instance ${count.index}"
  }
}
