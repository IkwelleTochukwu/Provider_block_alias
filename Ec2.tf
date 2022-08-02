# ec2 module for the instance in vpc-east_1

module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.1.1"

  name                        = local.name
  ami                         = var.ami_default
  associate_public_ip_address = true
  availability_zone           = "us-east-1a"
  instance_type               = var.instance_type
  key_name                    = "loginkey"
  subnet_id                   = element(module.vpc_us_east_1.public_subnets, 0)
  tags                        = local.tags
  vpc_security_group_ids      = [module.security-group-vpc_us_east_1.security_group_id]


  root_block_device = [
    {
      description = "root volume of the instance"
      volume_size = 8
    }
  ]
}

# ec2 module for the instance in vpc-east_2

module "ec2-instance-alias" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.1.1"
  providers = {
    aws = aws.east_2 
   }

  name                        = local.name
  ami                         = var.ami_alias
  associate_public_ip_address = true
  availability_zone           = "us-east-2a"
  instance_type               = var.instance_type
  key_name                    = "keyaccess"
  subnet_id                   = element(module.vpc_us_east_2.public_subnets, 0)
  tags                        = local.tags
  vpc_security_group_ids      = [module.security-group-vpc_us_east_2.security_group_id]


  root_block_device = [
    {
      description = "root volume of the instance"
      volume_size = 8
    }
  ]
}