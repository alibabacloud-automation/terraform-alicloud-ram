#########################################
# RAM user, login profile and access key
#########################################
module "ram_user" {
  source = "../../modules/ram-user"

  name                          = "terraformtest0"
  password                      = "123_Xxxxxxxxx"
  create_ram_user_login_profile = true
  create_ram_access_key         = true
}


