resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"

  tags = {
    Name = var.name
  }
}

#Public Subnet
resource "aws_subnet" "snet_public_a" {
  count             = var.create_public_snet ? 1 : 0
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.snet_public_cidr
  map_public_ip_on_launch                        = true
  availability_zone = "${var.region}a"
  tags = {
    Name = "snet-public-a"
  }
}

#Private Subnet
resource "aws_subnet" "snet_private_a" {
  count             = var.create_private_snet ? 1 : 0
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.snet_private_cidr
  availability_zone = "${var.region}a"
  tags = {
    Name = "snet-private-a"
  }
}

#Private Subnet
resource "aws_subnet" "snet_private_b" {
  count             = var.create_private_snet ? 1 : 0
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.snet_private_cidr_b
  availability_zone = "${var.region}b"
  tags = {
    Name = "snet-private-b"
  }
}

# IGW
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "igw-main"
  }
}

# Public sbnet route table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.snet_public_a[0].id
  route_table_id = aws_route_table.public.id
}

