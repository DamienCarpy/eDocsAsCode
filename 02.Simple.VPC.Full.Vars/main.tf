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

module "ec2_instance" {
  source                  = "terraform-aws-modules/ec2-instance/aws"
  for_each                = local.instances_map
  name                    = "instance-${each.key}"
  instance_type           = var.private_instances_type
  vpc_security_group_ids  = local.vpc_security_group_ids
  subnet_id               = each.value
  # ami                     = length(var.private_instances_ami_name) > 0 ? data.aws_ami.this[0].id : null
  tags                    = var.tags
}

module "eDocsAsCode" {
  source                           = "../modules/eDocsAsCode"
  # for_each                         = local.instances_map
  project_name                     = var.project_name
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
  private_instances_list           = var.private_instances_list
  private_instances_ami_description_list = data.aws_ami.this.description
  # private_instances_type           = [ for i in var.private_instances_list : module.ec2_instance[i].instance_type ]
}

resource "local_file" "doc" {
  content  = module.eDocsAsCode.doc-md
  filename = "../doc/doc.md"
}

resource "local_file" "diagram" {
  content  = module.eDocsAsCode.diagram-py
  filename = "../doc/diagram.py"
}

# output "ami_info" {
#   value = data.aws_ami.this
# }

output "instances" {
  value = distinct([ for i in var.private_instances_list : module.ec2_instance[i].ami ])
}