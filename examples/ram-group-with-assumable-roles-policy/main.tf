data "alicloud_account" "this" {
}

#########################
# RAM user
#########################
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

#########################
# Several ram assumable roles (admin, poweruser, readonly) in production ACS account
# Note: Anyone from ram account can assume them.
#########################
module "ram_assumable_roles_in_prod" {
  source = "../../modules/ram-assumable-roles"

  trusted_role_arns = [
    "acs:ram::${data.alicloud_account.this.id}:root"
  ]

  create_admin_role     = true
  create_poweruser_role = true

  create_readonly_role       = true
  readonly_role_requires_mfa = false

}

module "ram_assumable_role_custom" {
  source = "../../modules/ram-assumable-role"

  trusted_role_arns = [
    "acs:ram::${data.alicloud_account.this.id}:root"
  ]

  create_role = true

  role_name         = "custom"
  role_requires_mfa = true

  custom_role_policy_names = [
    "CodePipelinePassRole"
  ]
}

#########################
# ram group where user1 and user2 are allowed to assume readonly role in production ACS account
# Note: ram Alibaba Cloud account is default, so there is no need to specify it here.
#########################
module "ram_group_with_assumable_roles_policy_production_readonly" {
  source = "../../modules/ram-group-with-assumable-roles-policy"

  policy_name     = "AliyunOSSFullAccess"
  group_name      = "role-test-group"
  action          = "sts:AssumeRole"
  assumable_roles = [module.ram_assumable_roles_in_prod.this_readonly_ram_role_arn]

  user_names = [
    module.ram_user1.this_ram_user_name,
    module.ram_user2.this_ram_user_name,
  ]
}

#########################
# ram group where user1 is allowed to assume admin role in production ACS account
# Note: ram Alibaba Cloud account is default, so there is no need to specify it here.
#########################
module "ram_group_with_assumable_roles_policy_production_admin" {
  source = "../../modules/ram-group-with-assumable-roles-policy"

  policy_name = "AliyunOSSReadOnlyAccess"
  group_name  = "role-test-group1"

  action = "sts:AssumeRole"

  assumable_roles = [module.ram_assumable_roles_in_prod.this_admin_ram_role_arn]

  user_names = [
    module.ram_user1.this_ram_user_name,
  ]
}

#########################
# ram group where user2 is allowed to assume custom role in production ACS account
# Note: ram Alibaba Cloud account is default, so there is no need to specify it here.
#########################
module "ram_group_with_assumable_roles_policy_production_custom" {
  source = "../../modules/ram-group-with-assumable-roles-policy"

  policy_name = "AliyunNASFullAccess"
  group_name  = "role-test-group2"

  action = "sts:AssumeRole"

  assumable_roles = [module.ram_assumable_role_custom.this_ram_role_arn]

  user_names = [
    module.ram_user2.this_ram_user_name,
  ]
}