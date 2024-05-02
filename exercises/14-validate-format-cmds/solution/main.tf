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

resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  tags          = var.tags
}