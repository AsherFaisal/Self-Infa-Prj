# //////////////////////////////
# VARIABLES
# //////////////////////////////
variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "region" {
  default = "us-east-2"
}

variable "vpc_cidr" {
  default = "172.0.0.0/16"
}

variable "subnet_public_cidr" {
  default = "172.0.1.0/24"
}
variable "subnet_private_cidr" {
  default = "172.0.2.0/24"
}

