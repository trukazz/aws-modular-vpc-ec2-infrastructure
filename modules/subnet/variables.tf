

variable "subnets" {
  description = "Map of subnets to create"
  type = map(object({
    cidr = string
    az   = string
  }))
}

variable "vpc_id" {
  description = "VPC ID to attach to subnets"
  type        = string
}

