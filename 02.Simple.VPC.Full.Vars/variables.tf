variable "project_name" {
  description = "Name of the project."
  type        = string
  default     = "déjà-vu"
}

variable "region" {
  description = "Name of the main AWS region."
  type        = string
  default     = "eu-west-1"
}

variable "name" {
  description = "Name to be used on all the resources as identifier."
  type        = string
  default     = "my-vpc"
}

variable "cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs_letter_list" {
  description = "A list of availability zones letters in the region"
  type        = list(string)
  default     = ["a","b"]
}

variable "private_subnets_switch" {
  description = "Chose whether using private subnets."
  type        = bool
  default     = true
}

variable "private_subnets_newbits" {
  description = "Number of additional bits with which to extend the CIDR prefix for private subnets. The length of the list provides the number of subnets to build. For example, if given a prefix ending in /16 and a newbits value of 8, the resulting subnet address will have length /24."
  type        = number
  default     = 8
}

variable "private_subnets_netnum_offset" {
  description = "Number for calculating offset rank for private subnets. For example, for a netnum offset value of 100, the resulting first subnet will have the 100th rank in the CIDR subnetting."
  type        = number
  default     = 0
}

variable "public_subnets_switch" {
  description = "Chose whether using public subnets."
  type        = bool
  default     = true
}

variable "public_subnets_newbits" {
  description = "Number of additional bits with which to extend the CIDR prefix for public subnets. The length of the list provides the number of subnets to build. For example, if given a prefix ending in /16 and a newbits value of 8, the resulting subnet address will have length /24."
  type        = number
  default     = 8
}

variable "public_subnets_netnum_offset" {
  description = "Number for calculating offset rank for public subnets. For example, for a netnum offset value of 100, the resulting first subnet will have the 100th rank in the CIDR subnetting."
  type        = number
  default     = 100
}

variable "enable_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  type        = bool
  default     = false
}

variable "enable_vpn_gateway" {
  description = "Should be true if you want to create a new VPN Gateway resource and attach it to the VPC"
  type        = bool
  default     = false
}

variable "private_instances_list" {
  description = "List of instances names that will be spread on private subnets."
  type        = list(string)
  default     = ["toto","titi","tata","tutu"]
}

variable "private_instances_type" {
  description = "Family & size for instances."
  type        = string
  default     = "t3.nano"
}

variable "private_instances_ami_owner" {
  description = "Owner name or ID for building a filter and find AMI."
  type        = list(string)
  default     = ["679593333241"]
  # default     = []
}

variable "private_instances_ami_name" {
  description = "AMI partial name (using wildcards) for building a filter and find AMI."
  type        = list(string)
  default     = ["ubuntu-minimal/images/hvm-ssd/ubuntu-focal-20.04-*"]
  # default     = []
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "sbx"
  }
}