variable "region" {
  description = "Name of the main AWS region."
  type        = string
}

variable "name" {
  description = "The name of the VPC specified as argument to this module"
  type        = string
}

variable "azs" {
  description = "A list of availability zones specified as argument to this module"
  type        = list(string)
}

variable "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  type        = string
}

variable "private_subnets" {
  description = "List of IDs of private subnets"
  type        = list(string)
}

variable "private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  type        = list(string)
}

variable "private_subnets_ipv6_cidr_blocks" {
  description = "List of IPv6 cidr_blocks of private subnets in an IPv6 enabled VPC"
  type        = list(string)
}

variable "public_subnets" {
  description = "List of IDs of public subnets"
  type        = list(string)
}

variable "public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  type        = list(string)
}

variable "public_subnets_ipv6_cidr_blocks" {
  description = "List of IPv6 cidr_blocks of public subnets in an IPv6 enabled VPC"
  type        = list(string)
}
