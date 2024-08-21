################################
# RAM users
################################
module "ram_user1" {
  source = "../../modules/ram-user"

  name = "user1"

  create_ram_user_login_profile = false
  create_ram_access_key         = false
  password                      = "123_Xxxxxxxxx"
}

module "ram_user2" {
  source = "../../modules/ram-user"

  name = "user2"

  create_ram_user_login_profile = false
  create_ram_access_key         = false
  password                      = "123_Xxxxxxxxx"
}

################################
# RAM group for superadmins with full Administrator access
################################
module "ram_group_superadmins" {
  source = "../../modules/ram-group-with-policies"

  name = "super-admins"

  user_names = [
    module.ram_user1.this_ram_user_name,
    module.ram_user2.this_ram_user_name
  ]

  action      = ["oss:ListObjects"]
  effect      = "Deny"
  resource    = ["acs:oss:*:*:mybucket"]
  policy_type = "Custom"
  description = "example"
}
