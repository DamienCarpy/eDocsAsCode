data "aws_availability_zones" "available" {
  state = "available"
  
  filter {
    name   = "zone-name"
    values = local.azs
  }
}

data "aws_ami" "this" {
  most_recent = length(var.private_instances_ami_name) > 0 ? true : null
  owners      = length(var.private_instances_ami_owner) > 0 ? var.private_instances_ami_owner : null

  dynamic "filter" {
    for_each = length(var.private_instances_ami_name) > 0 ? [1] : []
    content {
      name     = "name"
      values   = var.private_instances_ami_name
    }
  }

  dynamic "filter" {
    for_each = length(var.private_instances_ami_name) > 0 ? [1] : []
    content {
      name   = "virtualization-type"
      values =  ["hvm"]
    }
  }

  dynamic "filter" {
    for_each = length(var.private_instances_ami_name) == 0 ? [1] : []
    content {
      name   = "image-id"
      values = distinct([ for i in var.private_instances_list : module.ec2_instance[i].ami ])
    }
  }
}