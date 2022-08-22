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
  region                           = var.region
  name                             = var.name
  vpc_cidr_block                   = var.cidr
  azs                              = data.aws_availability_zones.available.names
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

resource "local_file" "diagram" {
  content  = module.doc-vpc.diagram-py
  filename = "../doc/diagram.py"
}