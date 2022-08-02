# module block for the vpc in Us-east-1

module "vpc_us_east_1" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.2"

  name                 = local.name
  cidr                 = "14.10.0.0/16"
  public_subnets       = [element(var.public_subnet_cidr, 0)]
  private_subnets      = [element(var.private_subnet_cidr, 0)]
  azs                  = ["us-east-1a", "us-east-1b", "us-east-1c"]
  enable_dns_hostnames = true
  tags                 = local.tags
  vpc_tags             = local.tags
  create_igw           = true
}

# module block for the vpc in Us-east-2

module "vpc_us_east_2" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.2"
  providers = {
    aws = aws.east_2
  }

  name                 = local.name
  cidr                 = "14.10.0.0/16"
  public_subnets       = [element(var.public_subnet_cidr, 1)]
  private_subnets      = [element(var.private_subnet_cidr, 1)]
  azs                  = ["us-east-2a", "us-east-2b", "us-east-2c"]
  enable_dns_hostnames = true
  tags                 = local.tags
  vpc_tags             = local.tags
  create_igw           = true
}
