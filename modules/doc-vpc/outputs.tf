output "doc-md" {
  value = templatefile("${path.module}/doc.template.md",
    {
      name           = var.name
      azs            = var.azs
      vpc_cidr_block = var.vpc_cidr_block
      public_subnets = var.public_subnets
      public_subnets_cidr_blocks = var.public_subnets_cidr_blocks
      public_subnets_ipv6_cidr_blocks = var.public_subnets_ipv6_cidr_blocks
    }
  )
}