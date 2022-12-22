terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.47.0"
    }
  }
}
resource "aws_instance" "ubuntu" {
    ami = "ami-0283a57753b18025b"
    instance_type = "t2.micro"
    count = 2
}

resource "aws_iam_user" "iam-user" {
    name = "user${count.index}"
    count = 2
}

resource "aws_iam_group" "iam-group" {
    name = "Group${count.index}"
    count = 2
}