resource "aws_vpc" "my-vpc-1" {
  cidr_block = var.my-vpc-1
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "${var.project-name}-vpc-1"
  }
}

resource "aws_vpc" "my-vpc-2" {
  cidr_block = var.my-vpc-2
  enable_dns_hostnames = true
  instance_tenancy = "default"
  enable_dns_support = true
  tags = {
    Name = "${var.project-name}-vpc-2"
  }
}

resource "aws_vpc" "my-vpc-3" {
  cidr_block = var.my-vpc-3
  enable_dns_hostnames = true
  instance_tenancy = "default"
  enable_dns_support = true
  tags = {
    Name = "${var.project-name}-vpc-3"
  }
}

resource "aws_vpc" "my-vpc-4" {
  cidr_block = var.my-vpc-4
  enable_dns_hostnames = true
  instance_tenancy = "default"
  enable_dns_support = true
  tags = {
    Name = "${var.project-name}-vpc-4"
  }
}


data "aws_availability_zones" "my-az" {
  state = "available"
}

resource "aws_internet_gateway" "my-igw-1" {
  vpc_id = aws_vpc.my-vpc-1.id
  tags = {
        Name = "${var.project-name} - igw - 1"
    }
}

resource "aws_internet_gateway" "my-igw-3" {
  vpc_id = aws_vpc.my-vpc-3.id
  tags = {
        Name = "${var.project-name} - igw - 3"
    }
}

resource "aws_subnet" "my-subnet-1" {
  vpc_id = aws_vpc.my-vpc-1.id
  map_public_ip_on_launch = true
  cidr_block = var.my-subnet-1
  availability_zone =  data.aws_availability_zones.my-az.names[0]
  tags = {
    Name = "${var.project-name}-subnet-1"
  }
}

resource "aws_subnet" "my-subnet-2" {
  vpc_id = aws_vpc.my-vpc-2.id
  cidr_block = var.my-subnet-2
  availability_zone =  data.aws_availability_zones.my-az.names[1]
  tags = {
    Name = "${var.project-name}-subnet-2"
  }
}

resource "aws_subnet" "my-subnet-3" {
  vpc_id = aws_vpc.my-vpc-3.id
  map_public_ip_on_launch = true
  cidr_block = var.my-subnet-3
  availability_zone =  data.aws_availability_zones.my-az.names[2]
  tags = {
    Name = "${var.project-name}-subnet-3"
  }
}

resource "aws_subnet" "my-subnet-4" {
  vpc_id = aws_vpc.my-vpc-4.id
  cidr_block = var.my-subnet-4
  availability_zone =  data.aws_availability_zones.my-az.names[3]
  tags = {
    Name = "${var.project-name}-subnet-4"
  }
}

resource "aws_route_table" "my-rtb-1" {
  vpc_id = aws_vpc.my-vpc-1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-igw-1.id
  }
  tags = {
    Name = "${var.project-name}-rtb-1"
  }
}

resource "aws_route_table" "my-rtb-2" {
  vpc_id = aws_vpc.my-vpc-2.id
  tags = {
    Name = "${var.project-name}-rtb-2"
  }
}

resource "aws_route_table" "my-rtb-3" {
  vpc_id = aws_vpc.my-vpc-3.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-igw-3.id
  }
  tags = {
    Name = "${var.project-name}-rtb-3"
  }
}

resource "aws_route_table" "my-rtb-4" {
  vpc_id = aws_vpc.my-vpc-4.id
  
  tags = {
    Name = "${var.project-name}-rtb-4"
  }
}

resource "aws_route_table_association" "my-ass-1" {
  route_table_id = aws_route_table.my-rtb-1.id
  subnet_id = aws_subnet.my-subnet-1.id
}
resource "aws_route_table_association" "my-ass-2" {
  route_table_id = aws_route_table.my-rtb-2.id
  subnet_id = aws_subnet.my-subnet-2.id

}
resource "aws_route_table_association" "my-ass-3" {
  route_table_id = aws_route_table.my-rtb-3.id
  subnet_id = aws_subnet.my-subnet-3.id

}
resource "aws_route_table_association" "my-ass-4" {
  route_table_id = aws_route_table.my-rtb-4.id
  subnet_id = aws_subnet.my-subnet-4.id

}

resource "aws_security_group" "instnace-vpc-1" {
  vpc_id = aws_vpc.my-vpc-1.id
  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.project-name}-sg-vpc-1"
  }
}

resource "aws_security_group" "instnace-vpc-2" {
  vpc_id = aws_vpc.my-vpc-2.id
  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.project-name}-sg-vpc-2"
  }
}


resource "aws_security_group" "instnace-vpc-3" {
  vpc_id = aws_vpc.my-vpc-3.id
  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.project-name}-sg-vpc-3"
  }
}

resource "aws_security_group" "instnace-vpc-4" {
  vpc_id = aws_vpc.my-vpc-4.id
  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.project-name}-sg-vpc-4"
  }
}
