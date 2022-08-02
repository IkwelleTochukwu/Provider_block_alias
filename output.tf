output "ec2_default_region-public_IP" {
    description = "the public ip for instance in the default region"
    value = module.ec2-instance.public_ip
}

output "ec2_alias_region-public_IP" {
    description = "the public ip for instance in the alias region"
    value = module.ec2-instance-alias.public_ip
}