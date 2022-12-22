terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.47.0"
    }
  }
}

resource "aws_instance" "my_ec2" {
    ami = "${var.my_map["ami2"]}"
    instance_type = var.my_list[0]
}

output "pub_id" {
    value = aws_instance.my_ec2.public_ip
}

