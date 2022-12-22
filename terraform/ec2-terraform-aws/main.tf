terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.46.0"
    }
  }
}

# Create an EC2 instance
resource "aws_instance" "amazonlinux" {
  ami           = var.ami_id
  instance_type = var.type
}

#create key-pair
resource "aws_key_pair" "mykey" {
  key_name   = var.key_name
  public_key = file("var.path_pubkey")
}
