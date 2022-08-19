output "az-list" {
  value = data.aws_availability_zones.available.names
}
