data "aws_availability_zones" "available" {
  state = "available"
  
  filter {
    name   = "zone-name"
    values = local.azs
  }
}

data "aws_ami" "this" {
  most_recent = true
  owners      = var.private_instances_ami_owner

  filter {
    name   = "name"
    values = var.private_instances_ami_name
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}