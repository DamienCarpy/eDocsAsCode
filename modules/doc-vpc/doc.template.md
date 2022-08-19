# **VPC parameters**
## **Global parameters**
* This VPC is named `${name}`.
* It uses the following CIDR block: `${vpc_cidr_block}`.
* It spans the `${length(azs)}` following Availability Zones (AZs):
%{ for az in azs ~}
  * `${az}`
%{ endfor ~}

## **Subnets**
* This VPC counts `${length(public_subnets)}` public subnets with the following IPv4 range:
| Public subnet number | Public subnet IP range |
|:---:|:---:|
%{ for pub in public_subnets ~}
| ${pub} | %{ if element(public_subnets_cidr_blocks,index(public_subnets,pub)) == null } ${element(public_subnets_ipv6_cidr_blocks,index(public_subnets,pub))} %{ else } ${element(public_subnets_cidr_blocks,index(public_subnets,pub))}  %{ endif ~}|
%{ endfor ~}
