resource "aws_instance" "instnace-vpc-1" {
  ami = "ami-0a1179631ec8933d7"
  instance_type = "t2.micro"
  subnet_id = var.my-public-1
  key_name = "Nat"
  vpc_security_group_ids = [ var.my-sg-1 ]
  associate_public_ip_address = true
  root_block_device {
      volume_size = 8
      volume_type = "gp2"
      delete_on_termination = true
      encrypted = false
    }
  tags = {
    Name = "${var.project-name}-Instance-1"
  }
}

resource "aws_instance" "instnace-vpc-2" {
  ami = "ami-0a1179631ec8933d7"
  instance_type = "t2.micro"
  subnet_id = var.my-private-2
  key_name = "Nat"
  vpc_security_group_ids = [ var.my-sg-2 ]
  associate_public_ip_address = false
  root_block_device {
      volume_size = 8
      volume_type = "gp2"
      delete_on_termination = true
      encrypted = false
    }
  tags = {
    Name = "${var.project-name}-Instance-2"
  }
}

resource "aws_instance" "instnace-vpc-3" {
  ami = "ami-0a1179631ec8933d7"
  instance_type = "t2.micro"
  subnet_id = var.my-public-3
  key_name = "Nat"
  vpc_security_group_ids = [ var.my-sg-3 ]
  associate_public_ip_address = true
  root_block_device {
      volume_size = 8
      volume_type = "gp2"
      delete_on_termination = true
      encrypted = false
    }
  tags = {
    Name = "${var.project-name}-Instance-3"
  }
}

resource "aws_instance" "instnace-vpc-4" {
  ami = "ami-0a1179631ec8933d7"
  instance_type = "t2.micro"
  subnet_id = var.my-private-4
  key_name = "Nat"
  vpc_security_group_ids = [ var.my-sg-4 ]
  associate_public_ip_address = false
  root_block_device {
      volume_size = 8
      volume_type = "gp2"
      delete_on_termination = true
      encrypted = false
    }
  tags = {
    Name = "${var.project-name}-Instance-4"
  }
}