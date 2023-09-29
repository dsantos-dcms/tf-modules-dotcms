variable "name" {
  type    = string
  default = "vpc-main"
}

variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "create_public_snet" {
  type    = bool
  default = true
}

variable "snet_public_cidr" {
  default = "10.0.100.0/24"
}

variable "create_private_snet" {
  type    = bool
  default = true
}

variable "snet_private_cidr" {
  default = "10.0.101.0/24"
}

variable "snet_private_cidr_b" {
  default = "10.0.102.0/24"
}

variable "region" {
  default = "ca-central-1"
}