# //////////////////////////////
# VARIABLES
# //////////////////////////////
variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "region" {
  default = "us-east-2"
}

variable "vpc_cidr" {
  default = "172.16.0.0/16"
}

variable "subnet1_cidr" {
  default = "172.16.0.0/24"
}

variable "environment_list" {
  type    = list(string)
  default = ["DEV", "PROD"]
}

variable "environment_map" {
  type = map(string)
  default = {
    "DEV"  = "DEV",
    "PROD" = "PROD"
  }
}

variable "environment_instance_type" {
  type = map(string)
  default = {
    "DEV"  = "t2.micro",
    "PROD" = "t2.micro"
  }
}

variable "environment_instance_settings" {
  type = map(object({ instance_type = string, monitoring = bool }))
  default = {
    "DEV" = {
      instance_type = "t2.micro",
      monitoring    = false
    },
    "PROD" = {
      instance_type = "t2.micro",
      monitoring    = true
    }
  }
}

