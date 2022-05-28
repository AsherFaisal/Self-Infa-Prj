# //////////////////////////////
# RESOURCES
# //////////////////////////////

# VPC
resource "aws_vpc" "vpc1" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = "true"
  tags = {
    Name = "BookStore"
  }
}

# SUBNET
resource "aws_subnet" "subnet_private" {
  cidr_block              = var.subnet_private_cidr
  vpc_id                  = aws_vpc.vpc1.id
  map_public_ip_on_launch = "true"
  availability_zone       = data.aws_availability_zones.available.names[1]
}
resource "aws_subnet" "subnet_public" {
  cidr_block              = var.subnet_public_cidr
  vpc_id                  = aws_vpc.vpc1.id
  map_public_ip_on_launch = "true"
  availability_zone       = data.aws_availability_zones.available.names[1]
}

# INTERNET_GATEWAY
resource "aws_internet_gateway" "gateway1" {
  vpc_id = aws_vpc.vpc1.id
}

# ROUTE_TABLE
resource "aws_route_table" "route_table1" {
  vpc_id = aws_vpc.vpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway1.id
  }
}

resource "aws_route_table_association" "route_subnet_public" {
  subnet_id      = aws_subnet.subnet_public.id
  route_table_id = aws_route_table.route_table1.id
}


#ELASTIC_IP FOR PUBLIC NAT
resource "aws_eip" "eip_1" {
  vpc = true
  tags = {
    Name = "Public EIP"
  }

}

#NAT_GATEWAY FOR PUBLIC ACCESS
resource "aws_nat_gateway" "nat_public" {
  allocation_id = aws_eip.eip_1.id
  subnet_id     = aws_subnet.subnet_public.id

  tags = {
    Name = "public NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gateway1]
}
