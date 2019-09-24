provider "alicloud" {
  region = "cn-hangzhou"
}

#########################################
# RAM user, login profile and access key
#########################################
module "ram_user" {
  source = "../.."

  name = "terraformtest1"

  create_ram_user_login_profile = true
  password                      = "User@123"

  create_ram_access_key = true
}

