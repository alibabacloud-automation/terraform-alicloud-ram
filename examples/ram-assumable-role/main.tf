###############################
# RAM assumable role for admin
###############################
data "alicloud_account" "this" {
}

module "ram_assumable_role_admin" {
  source = "../../modules/ram-assumable-role"

  create_role = true
  role_name   = "admin1"
  description = "test ram-assumable-role-admin"

  role_requires_mfa = true

  attach_admin_policy = true
  action              = "sts:AssumeRole"
  trusted_role_arns = [
    "acs:ram::${data.alicloud_account.this.id}:root"
  ]
}

###############################
# RAM assumable role with custom policies
###############################
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

  custom_role_policy_names = [
    "CodePipelinePassRole"
  ]
}