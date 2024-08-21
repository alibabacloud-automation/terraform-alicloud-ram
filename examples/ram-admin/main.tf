##############################################
# RAM admin user, login profile and access key
##############################################
module "ram_admin" {
  source = "../.."

  name = "terraformtestadmin"

  create_ram_user_login_profile = true
  password                      = "123_Xxxxxxxxx"
  create_ram_access_key         = true
  is_admin                      = true
  admin_name_regex              = "AdministratorAccess"
}
