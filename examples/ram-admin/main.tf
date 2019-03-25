provider "alicloud" {
  region = "cn-hangzhou"
}

#########################################
# RAM admin, login profile
#########################################
module "ram_admin" {
  source = "../.."

  name = "terraformtest3"

  create_ram_user_login_profile = true
  password = "User@123"

  is_admin = true
}
