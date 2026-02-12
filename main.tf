module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
}

module "subnet" {
  source  = "./modules/subnet"
  vpc_id  = module.vpc.vpc_id
  subnets = var.subnets

}

module "sg" {
  source          = "./modules/security-group"
  vpc_id          = module.vpc.vpc_id
  security_groups = var.security_groups

}

module "EC2" {
  source             = "./modules/ec2"
  instances          = var.instances
  subnet_ids         = module.subnet.subnet_ids
  security_group_ids = module.sg.security_group_ids

}

module "igw" {
  source = "./modules/igw"
  vpc_id = module.vpc.vpc_id

  public_subnet_ids = [
    module.subnet.subnet_ids["public_subnet"]
  ]
}
