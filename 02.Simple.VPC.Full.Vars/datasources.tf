data "aws_availability_zones" "available" {
  state = "available"
  filter {
    name   = "zone-name"
    values = local.azs
  }
}

data "aws_ssm_parameter" "this" {
  name = var.private_instance_ami_ssm_parameter
}

data "aws_ami" "this" {
  most_recent = true

  filter {
    name   = "name"
    values = local.ami_filter
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}