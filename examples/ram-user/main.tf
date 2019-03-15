provider "alicloud" {
  region = "cn-hangzhou"
}

#########################################
# RAM user, login profile and access key
#########################################
module "ram_user" {
  source = "terraform-alicloud-ram/terraform-alicloud-ram/ram-user"

  name = "terraformtest1"

  password = "USer@123"
}
