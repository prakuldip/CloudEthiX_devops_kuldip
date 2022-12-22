terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.47.0"
    }
  }
}

resource "aws_instance" "dev_instance" {
    ami = var.ami_id
    instance_type = (var.is_dev == true) ?  var.for_dev : var.for_prod
    count = var.is_dev == true ? 3 : 1
}
