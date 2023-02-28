variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "node_root_password" {
  type = string
}

locals {
  common_tags = {
    project     = "demo"
    owner       = "Carlos Ramirez"
    environment = "dev"
  }
}
