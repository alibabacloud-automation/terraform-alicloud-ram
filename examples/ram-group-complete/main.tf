data "alicloud_account" "this" {
}

################################
# RAM users
################################
module "ram_user1" {
  source = "../../modules/ram-user"

  name = "user1"

  create_ram_user_login_profile = false
  create_ram_access_key         = false
  password                      = ""
}

module "ram_user2" {
  source = "../../modules/ram-user"

  name = "user2"

  create_ram_user_login_profile = false
  create_ram_access_key         = false
  password                      = ""
}

################################
# RAM group where user1 and user2 are allowed to assume admin role in production Alibaba Cloud account
################################
module "ram_group_complete" {
  source = "../../modules/ram-group-with-assumable-roles-policy"

  policy_name = "production-admin1"
  group_name  = "group1"

  assumable_roles = ["acs:ram::${data.alicloud_account.this.id}:role/admin"]
}

################################
# Extending policies of RAM group production-admins
################################
module "ram_group_complete_with_custom_policy" {
  source = "../../modules/ram-group-with-policies"

  name = module.ram_group_complete.this_group_name

  action   = ["oss:ListObjects"]
  resource = ["acs:oss:*:*:mybucket"]
  effect   = "Deny"

  create_group = false
  policy_name  = "AliyunOSSFullAccess"
  policy_type  = "Custom"
  user_names = [
    module.ram_user1.this_ram_user_name,
    module.ram_user2.this_ram_user_name,
  ]
}