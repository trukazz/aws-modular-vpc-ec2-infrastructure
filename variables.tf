variable "vpc_cidr" {
  type = string
}

############################################
# SECURITY GROUP VARIABLES
############################################
variable "security_groups" {
  type = map(object({
    name        = string
    description = string

    ingress = list(object({
      description = string
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))

    egress = list(object({
      description = string
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
  }))
}
############################################
# EC2 VARIABLES
############################################
variable "instances" {
  type = map(object({
    instance_name     = string
    instance_type     = string
    ami_id            = string
    security_group_id = string
    subnet_id         = string
    key_name          = string
  }))
}

############################################
# SUBNET VARIABLES
############################################
variable "subnets" {
  description = "Map of subnets to create"
  type = map(object({
    cidr = string
    az   = string
  }))
}
