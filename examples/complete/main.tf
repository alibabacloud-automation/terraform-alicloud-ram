##############
# RAM account
##############

module "ram" {
  source                        = "../.."
  create_user                   = true
  is_reader                     = false
  is_admin                      = false
  create_ram_user_login_profile = false
  create_ram_access_key         = false
  name                          = var.user_name
  force_destroy                 = var.force_destroy
}

module "ram2" {
  source                        = "../.."
  create_user                   = false
  is_reader                     = false
  is_admin                      = false
  create_ram_user_login_profile = true
  create_ram_access_key         = false
  password                      = var.password
  name                          = module.ram.this_ram_user_name
}

module "ram3" {
  source                        = "../.."
  create_user                   = false
  is_reader                     = false
  is_admin                      = false
  create_ram_user_login_profile = false
  create_ram_access_key         = true
  secret_file                   = var.secret_file
  name                          = module.ram.this_ram_user_name
}

module "ram4" {
  source                        = "../.."
  create_user                   = false
  is_reader                     = false
  is_admin                      = true
  create_ram_user_login_profile = false
  create_ram_access_key         = false
  name                          = module.ram.this_ram_user_name
}

module "ram5" {
  source                        = "../.."
  create_user                   = false
  is_reader                     = true
  is_admin                      = false
  create_ram_user_login_profile = false
  create_ram_access_key         = false
  name                          = module.ram.this_ram_user_name
}
