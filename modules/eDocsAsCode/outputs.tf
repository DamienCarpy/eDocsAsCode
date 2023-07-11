output "doc-md" {
  value = templatefile("${path.module}/doc.template.md",
    {
      project_name                     = var.project_name
      region                           = var.region
      name                             = var.name
      azs                              = var.azs
      vpc_cidr_block                   = var.vpc_cidr_block
      public_subnets                   = var.public_subnets
      public_subnets_cidr_blocks       = var.public_subnets_cidr_blocks
      public_subnets_ipv6_cidr_blocks  = var.public_subnets_ipv6_cidr_blocks
      private_subnets                  = var.private_subnets
      private_subnets_cidr_blocks      = var.private_subnets_cidr_blocks
      private_subnets_ipv6_cidr_blocks = var.private_subnets_ipv6_cidr_blocks
      private_instances_list           = var.private_instances_list
      private_instances_ami_description_list    = var.private_instances_ami_description_list
      # private_instances_type           = var.private_instances_type
    }
  )
}

output "diagram-py" {
  value = templatefile("${path.module}/diagram.template.py",
    {
      region                           = var.region
      name                             = var.name
      azs                              = var.azs
      vpc_cidr_block                   = var.vpc_cidr_block
      public_subnets                   = var.public_subnets
      public_subnets_cidr_blocks       = var.public_subnets_cidr_blocks
      public_subnets_ipv6_cidr_blocks  = var.public_subnets_ipv6_cidr_blocks
      private_subnets                  = var.private_subnets
      private_subnets_cidr_blocks      = var.private_subnets_cidr_blocks
      private_subnets_ipv6_cidr_blocks = var.private_subnets_ipv6_cidr_blocks
    }
  )
}