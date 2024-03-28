# ![My Skills](https://skillicons.dev/icons?i=aws,vscode,git,github) <img src ="https://github.com/DrllSGT/AWS-EC2-Terraform-Config/assets/52445175/0589c912-b092-4e72-b4ed-b1c2f0626761" width=48>
# AWS EC2 Terraform Configuration File 



Tasked with creating a Terraform configuration file for deploying an Amazon Elastic Compute Cloud (EC2) instance in AWS. The EC2 instance should be launched in a VPC with a single subnet and an internet gateway should be attached to the VPC to allow internet access. The EC2 instance should use an existing Amazon Machine Image (AMI) and should have a security group that allows SSH access from my IP address. I created a Terraform file that satisfies the below requirements:

1. Define variable in main.tf for your IP Address. Name of the variable should be "test_ip_address"
2. Remember to edit your Region in the main.tf file, I've used "eu-west-2"
3. VPC name should be "test_vpc" and CIDR block should be "10.0.0.0/16"
4. Internet Gateway name should be "test_igw"
5. Subnet name should be "test_subnet" and CIDR block should be "10.0.1.0/22"
6. Security group name should be "test_sg" and ingress details should be

    From Port - 22
    To Port - 22
    Protocol - TCP
    CIDR Block = ${var.test_ip_address}/24

7. EC2 instance name should be "test_instance" with below AMI details:

    ami - ami-0c44b239cbfafe2f9
    instance_type - t3.small
    subnet_id - aws_subnet.test_subnet.id
    vpc_security_group_ids = [aws_security_group.test_sg.id ]

Found this to be useful:
https://registry.terraform.io/providers/hashicorp/aws/latest/docs

The main.tf file I created defines a VPC, subnet, internet gateway, security group, and EC2 instance as specified in the requirements. The security group allows SSH ingress from the provided IP address variable.

