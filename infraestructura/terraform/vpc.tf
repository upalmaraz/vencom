resource "aws_vpc" "vpc_production" {
  cidr_block           = "10.60.0.0/21"
  enable_dns_hostnames = "true"

  tags {
    Name = "production"
  }
}

resource "aws_subnet" "subnet_production" {
  vpc_id     = "${aws_vpc.vpc_production.id}"
  cidr_block = "10.60.0.0/24"

  tags {
    Name = "subnet_vencom"
  }
}

resource "aws_internet_gateway" "gw_production" {
  vpc_id = "${aws_vpc.vpc_production.id}"

  tags {
    Name = "production"
  }
}

resource "aws_route_table" "route_productionr" {
  vpc_id = "${aws_vpc.vpc_production.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw_production.id}"
  }

  tags {
    name = "production_vencom"
  }
}

resource "aws_main_route_table_association" "a" {
  vpc_id         = "${aws_vpc.vpc_production.id}"
  route_table_id = "${aws_route_table.route_productionr.id}"
}
