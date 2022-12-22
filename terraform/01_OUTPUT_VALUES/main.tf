terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.47.0"
    }
  }
}
#create eip and output its value
resource "aws_eip" "lb" {
  vpc      = true
}

output "my_eip" {
    value = aws_eip.lb.id
}

