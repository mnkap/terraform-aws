variable "env_code" {
  type = string
}

variable "password" {
  default = "password"
}

variable "security_groups" {
  description = "The security groups to attach to the load balancer. e.g. [\"sg-edcd9784\",\"sg-edcd9785\"]"
  type        = list(string)
  default     = []
}

variable "target_groups" {
  description = "A list of maps containing key/value pairs that define the target groups to be created. Order of these maps is important and the index of these are to be referenced in listener definitions. Required key/values: name, backend_protocol, backend_port"
  type        = any
  default     = []
}

variable "public_subnets" {
  default = "public_subnets"
}

variable "private_subnets" {
  default     = []
  description = "Private subnets for VPC"
  type        = list(string)
}

variable "vpc_id" {
  default = "vpc_id"
}


variable "target_group_arn" {
  default = "target_group_arn"
}

variable "load_balancer_security_group" {
  default = "load_balancer_security_group"
}
