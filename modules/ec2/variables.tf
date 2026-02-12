

variable "subnet_ids" {
  type = map(string)
}

variable "security_group_ids" {
  type = map(string)
}

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
