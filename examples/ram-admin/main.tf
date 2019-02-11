provider "alicloud" {
  region = "cn-hangzhou"
}

#########################################
# RAM user, login profile and access key
#########################################
module "ram_admin" {
  source = "../../modules/ram-admin"

  name = "terraformtest2"

  password = "USer@123"
}
