provider "aws" {
  region = var.region
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.name
  cidr = var.cidr

  azs             = local.azs
  private_subnets = cidrsubnets(var.cidr, var.private_subnets_newbits...)
  public_subnets  = cidrsubnets(var.cidr, var.public_subnets_newbits...)

  tags = var.tags
}

output "az-list" {
  value = local.azs
}