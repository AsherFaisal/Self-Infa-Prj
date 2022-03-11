# //////////////////////////////
# VARIABLES
# //////////////////////////////
variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "bucket_name" {
  default = "terraformstate1738"
}

# //////////////////////////////
# PROVIDER
# //////////////////////////////
provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = "us-east-2"
}

# //////////////////////////////
# TERRAFORM USER
# //////////////////////////////
data "aws_iam_user" "terraform" {
  user_name = "terraform"
}

resource "aws_s3_bucket" "tfRemoteState" {
  bucket        = var.bucket_name
  force_destroy = true
}
