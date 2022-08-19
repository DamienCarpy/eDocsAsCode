provider "aws" {
  region = var.region
}

module "vpc" {
  source          = "terraform-aws-modules/vpc/aws"
  name            = var.name
  cidr            = var.cidr
  azs             = data.aws_availability_zones.available.names
  private_subnets = local.private_subnets
  public_subnets  = local.public_subnets
  tags            = var.tags
}

module "doc-vpc" {
  source                           = "../modules/doc-vpc"
  name                             = module.vpc.name
  vpc_cidr_block                   = module.vpc.vpc_cidr_block
  azs                              = module.vpc.azs
  private_subnets                  = module.vpc.private_subnets
  private_subnets_cidr_blocks      = module.vpc.private_subnets_cidr_blocks
  private_subnets_ipv6_cidr_blocks = module.vpc.private_subnets_ipv6_cidr_blocks
  public_subnets                   = module.vpc.public_subnets
  public_subnets_cidr_blocks       = module.vpc.public_subnets_cidr_blocks
  public_subnets_ipv6_cidr_blocks  = module.vpc.public_subnets_ipv6_cidr_blocks

}

resource "local_file" "doc" {
  content  = module.doc-vpc.doc-md
  filename = "../doc/doc.md"
}