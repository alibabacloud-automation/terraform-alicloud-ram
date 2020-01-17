provider "alicloud" {
  version                 = ">=1.64.0"
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/ram-assumable-role"
}

resource "random_uuid" "this" {}

resource "alicloud_ram_role" "this" {
  count = var.create_role ? 1 : 0

  name        = local.role_name
  document    = var.role_requires_mfa ? local.assume_role_with_mfa_document : local.assume_role_document
  description = var.description
  force       = var.force
}

resource "alicloud_ram_role_policy_attachment" "custom" {
  count = var.create_role && length(var.custom_role_policy_names) > 0 ? length(var.custom_role_policy_names) : 0

  role_name   = alicloud_ram_role.this[0].name
  policy_name = element(var.custom_role_policy_names, count.index)
  policy_type = "Custom"
}

resource "alicloud_ram_role_policy_attachment" "admin" {
  count = var.create_role && var.attach_admin_policy ? 1 : 0

  role_name   = alicloud_ram_role.this[0].name
  policy_name = var.admin_role_policy_name
  policy_type = "System"
}

resource "alicloud_ram_role_policy_attachment" "poweruser" {
  count = var.create_role && var.attach_poweruser_policy ? 1 : 0

  role_name   = alicloud_ram_role.this[0].name
  policy_name = var.power_role_policy_name
  policy_type = "System"
}

resource "alicloud_ram_role_policy_attachment" "readonly" {
  count = var.create_role && var.attach_readonly_policy ? 1 : 0

  role_name   = alicloud_ram_role.this[0].name
  policy_name = var.readonly_role_policy_name
  policy_type = "System"
}