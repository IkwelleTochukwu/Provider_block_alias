# module for security group to attach to vpc-east_1

module "security-group-vpc_us_east_1" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.9.0"

  vpc_id      = module.vpc_us_east_1.vpc_id
  description = "sg for vpc_us_east_1"
  name        = local.name
  tags        = local.tags
  ingress_with_cidr_blocks = [
    {
      description = "ingress ssh"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },

    {
      description = "ingress http"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  egress_with_cidr_blocks = [
    {
      description = "egress all"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}


# module for security group to attach to vpc-east_2

module "security-group-vpc_us_east_2" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.9.0"
  providers = {
    aws = aws.east_2
  }

  vpc_id      = module.vpc_us_east_2.vpc_id
  description = "sg for vpc_us_east_2"
  name        = local.name
  tags        = local.tags
  ingress_with_cidr_blocks = [
    {
      description = "ingress ssh"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },

    {
      description = "ingress http"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  egress_with_cidr_blocks = [
    {
      description = "egress all"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}
