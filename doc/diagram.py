from diagrams import Cluster, Diagram
from diagrams.aws.general import User
from diagrams.generic.blank import Blank
from diagrams.generic.network import Subnet

with Diagram("my-vpc", show=False, direction="TB"):
    user = User("User")

    with Cluster("eu-west-1"):

        with Cluster("my-vpc - 10.0.0.0/16"):

            with Cluster("eu-west-1a"):
                with Cluster("public"):

                    subnet_a = Subnet("10.0.100.0/24")

                with Cluster("private"):

                    subnet_a = Subnet("10.0.0.0/24")

