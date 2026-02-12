variable "vpc_id" {
  description = "VPC ID for the security groups"
  type        = string
}

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
