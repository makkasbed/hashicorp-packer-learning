resource "aws_vpc" "packer" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "VPC for packer images"
  }
}

resource "aws_subnet" "public_nets" {
  count      = length(var.public_subnet_cidrs)
  vpc_id     = aws_vpc.packer.id
  cidr_block = element(var.public_subnet_cidrs, count.index)
  tags = {
    Name = "Public Subnet ${count.index + 1}"
  }
}

resource "aws_subnet" "private_nets" {
  count      = length(var.private_subnet_cidrs)
  vpc_id     = aws_vpc.packer.id
  cidr_block = element(var.private_subnet_cidrs, count.index)
  tags = {
    Name = "Private Subnet ${count.index + 1}"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.packer.id
  tags = {
    Name = "Packer VPC IG"
  }
}

resource "aws_route_table" "second_rt" {
  vpc_id = aws_vpc.packer.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "2nd Route Table"
  }
}

resource "aws_route_table_association" "public_nets_association" {
  count          = length(var.private_subnet_cidrs)
  subnet_id      = element(aws_subnet.public_nets[*].id, count.index)
  route_table_id = aws_route_table.second_rt.id
}