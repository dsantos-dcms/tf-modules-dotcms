variable "instance_type" {
  default = "t3.large"
}

variable "key_name" {
  
}

variable "name" {
  default = "dotCMS-ec2"
}

variable "subnet_id" {
  
}

variable "private_ips" {
  
}

variable "private_ip" {
  
}

variable "vpc_id" {
  
}

variable "allow_ssm" {
  type = bool
  default = true
}