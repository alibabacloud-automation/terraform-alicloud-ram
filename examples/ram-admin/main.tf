provider "alicloud" {
  region = "cn-hangzhou"
}

#########################################
# RAM admin user, login profile and access key
#########################################
module "ram_admin" {
  source = "../.."

  name = "terraformtest3"

  create_ram_user_login_profile = true
  password                      = "User@123"

  create_ram_access_key = true

  is_admin = true
}

