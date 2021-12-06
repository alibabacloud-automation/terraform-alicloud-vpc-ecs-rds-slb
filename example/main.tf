variable "name" {
  default = "terraform_test"
}

data "alicloud_zones" "default" {
  enable_details = true
}

module "example" {
  source            = "../"
  name              = var.name
  availability_zone = "cn-hangzhou-h"
}
