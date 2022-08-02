variable "public_subnet_cidr" {
  description = "the public subnet cidr block"
  type        = list(string)
  default = [
    "14.10.1.0/24",
    "14.10.2.0/24",
    "14.10.3.0/24",
    "14.10.4.0/24",
    "14.10.5.0/24",
  ]
}

variable "private_subnet_cidr" {
  description = "the private subnet cidr block"
  type        = list(string)
  default = [
    "14.10.10.0/24",
    "14.10.20.0/24",
    "14.10.30.0/24",
    "14.10.40.0/24",
    "14.10.50.0/24",
  ]
}

variable "instance_type" {
  description = "the instance type for server"
  type        = string
  default     = "t2.micro"
}

variable "ami_default" {
  description = "the aws ami specific for the default region of deplyment"
  type        = string
}

variable "ami_alias" {
  description = "the aws ami specific for the alias region of deployment"
  type        = string
}