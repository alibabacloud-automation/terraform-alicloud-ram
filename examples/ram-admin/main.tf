provider "alicloud" {
  region = "cn-hangzhou"
}

#########################################
# RAM user, login profile and access key
#########################################
module "ram_admin" {
  source = "terraform-alicloud-ram/terraform-alicloud-ram/ram-admin"

  name = "terraformtest3"

  password = "USer@123"
  is_admin = true
}
