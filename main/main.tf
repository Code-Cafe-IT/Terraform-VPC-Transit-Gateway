provider "aws" {
  region = "us-east-1"
  access_key = ""
  secret_key = ""
}

module "vpc" {
  source = "../module/vpc"
  project-name      = var.project-name
  my-vpc-1          = var.my-vpc-1
  my-vpc-2          = var.my-vpc-2
  my-vpc-3          = var.my-vpc-3
  my-vpc-4          = var.my-vpc-4
  my-subnet-1       = var.my-subnet-1
  my-subnet-2       = var.my-subnet-2
  my-subnet-3       = var.my-subnet-3
  my-subnet-4       = var.my-subnet-4
}

module "ec2" {
  source = "../module/ec2"
  project-name      = var.project-name
  my-sg-1           = module.vpc.my-sg-1
  my-sg-2           = module.vpc.my-sg-2
  my-sg-3           = module.vpc.my-sg-3
  my-sg-4           = module.vpc.my-sg-4
  my-public-1       = module.vpc.my-subnet-1
  my-private-2       = module.vpc.my-subnet-2
  my-public-3       = module.vpc.my-subnet-3
  my-private-4       = module.vpc.my-subnet-4
}