vpc_cidr = "10.0.0.0/16"

#################################################
#SUBNETS
#################################################
subnets = {
  public_subnet = {
    cidr = "10.0.1.0/24"
    az   = "eu-west-2a"
  }

  private_subnet = {
    cidr = "10.0.2.0/24"
    az   = "eu-west-2b"
  }
}
#################################################

#################################################
#SECURITY GROUPS
#################################################
security_groups = {
  ssh_sg = {
    name        = "ssh_sg"
    description = "Allow ssh"

    ingress = [{
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "allows ssh inbound"
    }]

    egress = [{
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      description = "allow all outbound"
    }]
  }
}
##################################################
#EC2
##################################################
instances = {
  "app" = {
    instance_name     = "App"
    instance_type     = "t3.micro"
    ami_id            = "ami-075f150fc1ca69e71"
    security_group_id = "ssh_sg"
    subnet_id         = "public_subnet"
    key_name          = "tg-2026"

  }
}
