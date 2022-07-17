locals {
  ## limit to first N AZs in the region
  azs = slice(data.aws_availability_zones.available.names, 0, var.max_azs_number)
}