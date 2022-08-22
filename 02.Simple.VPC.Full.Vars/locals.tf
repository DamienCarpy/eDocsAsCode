locals {
  azs = [for az in var.azs_letter_list : "${var.region}${az}"]

  private_subnets = var.private_subnets_switch ? [for az in local.azs :
    cidrsubnet(
      var.cidr,
      var.private_subnets_newbits,
      var.private_subnets_netnum_offset + index(local.azs, az)
    )
  ] : []

  public_subnets = var.public_subnets_switch ? [for az in local.azs :
    cidrsubnet(
      var.cidr,
      var.public_subnets_newbits,
      var.public_subnets_netnum_offset + index(local.azs, az)
    )
  ] : []
}