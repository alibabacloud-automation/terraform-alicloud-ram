# RAM account
module "ram_user" {
  source = "../.."

  #alicloud_ram_user
  create_user = true

  name          = "tf-testacc-name"
  force_destroy = var.force_destroy

  #alicloud_ram_login_profile
  create_ram_user_login_profile = false

  #alicloud_ram_access_key
  create_ram_access_key = false

  #alicloud_ram_user_policy_attachment
  is_admin = false

  #alicloud_ram_user_policy_attachment
  is_reader = false

}

module "ram_login_profile" {
  source = "../.."

  #alicloud_ram_user
  create_user = false

  #alicloud_ram_login_profile
  create_ram_user_login_profile = true

  name     = module.ram_user.this_ram_user_name
  password = var.password

  #alicloud_ram_access_key
  create_ram_access_key = false

  #alicloud_ram_user_policy_attachment
  is_admin = false

  #alicloud_ram_user_policy_attachment
  is_reader = false

}

module "ram_access_key" {
  source = "../.."

  #alicloud_ram_user
  create_user = false

  #alicloud_ram_login_profile
  create_ram_user_login_profile = false

  #alicloud_ram_access_key
  create_ram_access_key = true
  name                  = module.ram_user.this_ram_user_name
  secret_file           = "secret.txt"

  #alicloud_ram_user_policy_attachment
  is_admin = false

  #alicloud_ram_user_policy_attachment
  is_reader = false

}

module "ram_user_admin" {
  source = "../.."

  #alicloud_ram_user
  create_user = false

  #alicloud_ram_login_profile
  create_ram_user_login_profile = false

  #alicloud_ram_access_key
  create_ram_access_key = false

  #alicloud_ram_user_policy_attachment
  is_admin = true

  admin_name_regex = "^AdministratorAccess$"
  name             = module.ram_user.this_ram_user_name
  policy_type      = "System"

  #alicloud_ram_user_policy_attachment
  is_reader = false

}

module "ram_user_reader" {
  source = "../.."

  #alicloud_ram_user
  create_user = false

  #alicloud_ram_login_profile
  create_ram_user_login_profile = false

  #alicloud_ram_access_key
  create_ram_access_key = false

  #alicloud_ram_user_policy_attachment
  is_admin = false

  #alicloud_ram_user_policy_attachment
  is_reader = true

  reader_name_regex = "^ReadOnlyAccess$"
  name              = module.ram_user.this_ram_user_name
  policy_type       = "System"

}