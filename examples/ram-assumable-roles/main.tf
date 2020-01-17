######################
# ram assumable roles
######################
data "alicloud_account" "this" {
}

module "ram_assumable_roles" {
  source = "../../modules/ram-assumable-roles"

  create_admin_role          = true
  admin_role_name            = "admin2"
  create_poweruser_role      = true
  poweruser_role_name        = "OSS-and-NASR"
  create_readonly_role       = false
  readonly_role_requires_mfa = false

  action = "sts:AssumeRole"
  trusted_role_arns = [
    "acs:ram::${data.alicloud_account.this.id}:root"
  ]
  poweruser_role_policy_names = [
    "AliyunOSSFullAccess",
    "AliyunNASReadOnlyAccess"
  ]
}