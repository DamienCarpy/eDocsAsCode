# **VPC parameters**
## **Global parameters**
* This VPC is named `${name}` and resides in the `${region}` region.
* It uses the following CIDR block: `${vpc_cidr_block}`.
* It spans the `${length(azs)}` following Availability Zones (AZs):
%{ for az in azs ~}
  * `${az}`
%{ endfor ~}

## **Subnets**
* This VPC counts `${length(public_subnets)}` public subnets and  `${length(private_subnets)}` private subnets:

| Availability Zone | Public subnet ID | Public subnet IP range | Private subnet ID | Private subnet IP range | 
| --- | --- | --- | --- | --- |
%{ for az in azs ~}
| ${az} | %{ if length(public_subnets) != 0 }${element(public_subnets,index(azs,az))} %{ else ~} "N/A" %{ endif ~} | %{ if length(public_subnets_cidr_blocks) != 0 }${element(public_subnets_cidr_blocks,index(azs,az))} %{ else ~}%{ if length(public_subnets_ipv6_cidr_blocks) != 0 }${element(public_subnets_ipv6_cidr_blocks,index(azs,az))} %{ else ~} "N/A" %{ endif ~}%{ endif ~}| %{ if length(private_subnets) != 0 }${element(private_subnets,index(azs,az))} %{ else ~} "N/A" %{ endif ~}| %{ if length(private_subnets_cidr_blocks) != 0 }${element(private_subnets_cidr_blocks,index(azs,az))} %{ else ~}%{ if length(private_subnets_ipv6_cidr_blocks) != 0 }${element(private_subnets_ipv6_cidr_blocks,index(azs,az))} %{ else ~} "N/A" %{ endif ~}%{ endif ~}|
%{ endfor ~}
