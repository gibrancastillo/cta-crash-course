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

module "app_server" {
  source = "./modules/ec2"
  ami_id = "ami-077ee47512dc6f3ca"
  tags = { Name: "App Server" }
}