locals {
  azs = [for az in var.azs_letter_list : "${var.region}${az}"]

  private_subnets = [for az in local.azs :
    cidrsubnet(
      var.cidr,
      var.private_subnets_newbit,
      var.private_subnets_netnum_offset + index(local.azs, az)
    )
  ]

  public_subnets = [for az in local.azs :
    cidrsubnet(
      var.cidr,
      var.public_subnets_newbit,
      var.public_subnets_netnum_offset + index(local.azs, az)
    )
  ]
}