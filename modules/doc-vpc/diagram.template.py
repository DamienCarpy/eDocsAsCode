from diagrams import Cluster, Diagram
from diagrams.aws.general import User
from diagrams.generic.blank import Blank
from diagrams.generic.network import Subnet

with Diagram("${name}", show=False, direction="TB"):
    user = User("User")

    with Cluster("${region}"):

%{ for az in reverse(azs) ~}
        with Cluster("${az}"):
            with Cluster("public"):
%{ if length(public_subnets_cidr_blocks) == 0 }%{ if length(public_subnets_ipv6_cidr_blocks) == 0 }
%{ else ~}
                subnet_${trimprefix(az,region)} = Subnet("${element(public_subnets_ipv6_cidr_blocks,index(azs,az))}")
%{ endif ~}%{ else ~}
                subnet_${trimprefix(az,region)} = Subnet("${element(public_subnets_cidr_blocks,index(azs,az))}")
%{ endif ~}

            with Cluster("private"):
%{ if length(private_subnets_cidr_blocks) == 0 }%{ if length(private_subnets_ipv6_cidr_blocks) == 0 }
%{ else ~}
                subnet_${trimprefix(az,region)} = Subnet("${element(private_subnets_ipv6_cidr_blocks,index(azs,az))}")
%{ endif ~}%{ else ~}
                subnet_${trimprefix(az,region)} = Subnet("${element(private_subnets_cidr_blocks,index(azs,az))}")
%{ endif ~}

%{ endfor ~}