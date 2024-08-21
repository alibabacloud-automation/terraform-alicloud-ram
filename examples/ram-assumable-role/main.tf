###############################
# RAM assumable role for admin
###############################
data "alicloud_account" "this" {
}

data "alicloud_ram_policies" "admin" {
  name_regex = "AdministratorAccess"
  type       = "System"
}

module "ram_assumable_role_admin" {
  source = "../../modules/ram-assumable-role"

  create_role = true
  role_name   = "admin1"
  description = "test ram-assumable-role-admin"

  role_requires_mfa = true

  attach_admin_policy    = true
  admin_role_policy_name = concat(data.alicloud_ram_policies.admin.*.policies.0.policy_name, [""])[0]
  action                 = "sts:AssumeRole"
  trusted_role_arns = [
    "acs:ram::${data.alicloud_account.this.id}:root"
  ]
  trusted_role_services = [
    "ecs.aliyuncs.com"
  ]
}

###############################
# RAM assumable role with custom policies
###############################

data "alicloud_ram_policies" "custom" {
  type       = "Custom"
}

module "ram_assumable_role_custom" {
  source = "../../modules/ram-assumable-role"

  create_role       = true
  role_name         = "custom2"
  description       = "test ram-assumable-role-custom"
  role_requires_mfa = true
  action            = "sts:AssumeRole"

  trusted_role_arns = [
    "acs:ram::${data.alicloud_account.this.id}:root"
  ]
  trusted_role_services = [
    "ecs.aliyuncs.com"
  ]

  custom_role_policy_names = [
    concat(data.alicloud_ram_policies.custom.*.policies.0.policy_name, [""])[0]
  ]
}
