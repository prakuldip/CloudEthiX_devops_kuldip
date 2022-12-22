terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.47.0"
    }
  }
}

data "aws_ami" "ubuntu" {
    
    filter {
        name = "name"
        values = ["ubunut/images/hvm-ssd/ubuntu-focal-20.04-amd64-server"]
    }
    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }
    owners = ["099720109477"]
}
