terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.46.0"
    }
  }
}

#creating vpc
resource "aws_vpc" "ce-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "cloudethix-vpc"
  }
}

#creating public subnets
resource "aws_subnet" "ce-pub1" {
  vpc_id     = aws_vpc.ce-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "cloudethix-vpc-pub1"
  }
}

resource "aws_subnet" "ce-pub2" {
  vpc_id     = aws_vpc.ce-vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "cloudethix-vpc-pub2"
  }
}

#creating private subnets
resource "aws_subnet" "ce-pri1" {
  vpc_id     = aws_vpc.ce-vpc.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "cloudethix-vpc-pri1"
  }
}

resource "aws_subnet" "ce-pri2" {
  vpc_id     = aws_vpc.ce-vpc.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "cloudethix-vpc-pri2"
  }
}

#creating internet gateway
resource "aws_internet_gateway" "ce-ig" {
  vpc_id = aws_vpc.ce-vpc.id

  tags = {
    Name = "cloudethix-internet-gateway"
  }
}

#creating elsatic ip
resource "aws_eip" "ce-eip" {
  vpc = true

  tags = {
    Name = "cloudethix-eip"
  }
}


#creating nat gateway
resource "aws_nat_gateway" "ce-ng" {
  allocation_id = aws_eip.ce-eip.id
  subnet_id     = aws_subnet.ce-pub1.id

  tags = {
    Name = "cloudethix-nat-gateway"
  }
}


#creating route tables
resource "aws_route_table" "ce-pubrtb" {
  vpc_id = aws_vpc.ce-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ce-ig.id
  }

  tags = {
    Name = "clouethix-public-route-table"
  }
}

resource "aws_route_table" "ce-prirtb" {
  vpc_id = aws_vpc.ce-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ce-ng.id
  }


  tags = {
    Name = "clouethix-private-route-table"
  }
}

#creating route table association
resource "aws_route_table_association" "pubrtb-pub1" {
  route_table_id = aws_route_table.ce-pubrtb.id
  subnet_id = aws_subnet.ce-pub1.id
}

resource "aws_route_table_association" "pubrtb-pub2" {
  route_table_id = aws_route_table.ce-pubrtb.id
  subnet_id = aws_subnet.ce-pub2.id
}

resource "aws_route_table_association" "prirtb-pri1" {
  route_table_id = aws_route_table.ce-prirtb.id
  subnet_id = aws_subnet.ce-pri1.id
}

resource "aws_route_table_association" "prirtb-pri2" {
  route_table_id = aws_route_table.ce-prirtb.id
  subnet_id = aws_subnet.ce-pri2.id
}












