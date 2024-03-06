terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.17.1"
    }
  }
}

provider "aws" {
  region = "us-west-2"
  profile = "terraform_profile"
}

variable "instance_count" {
  type = number
  description = "The number of EC2 instances to be managed."
  default = 3
}

resource "aws_instance" "app_server" {
  count         = var.instance_count
  ami           = "ami-077ee47512dc6f3ca"
  instance_type = "t2.nano"
  tags = {
    Name = "instance ${count.index}"
    //Name = "app_server${count.index}"
  }
}