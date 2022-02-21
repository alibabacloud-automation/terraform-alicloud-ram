resource "random_uuid" "this" {
}

# Admin
resource "alicloud_ram_role" "admin" {
  count = var.create_admin_role ? 1 : 0

  name        = local.admin_role_name
  document    = var.admin_role_requires_mfa ? local.assume_role_with_mfa_document : local.assume_role_document
  description = var.description
  force       = var.force
}

resource "alicloud_ram_role_policy_attachment" "admin" {
  count = var.create_admin_role && length(var.admin_role_policy_names) > 0 ? length(var.admin_role_policy_names) : 0

  role_name   = alicloud_ram_role.admin[0].name
  policy_name = element(var.admin_role_policy_names, count.index)
  policy_type = "System"
}

# Poweruser
resource "alicloud_ram_role" "poweruser" {
  count = var.create_poweruser_role ? 1 : 0

  name        = local.poweruser_role_name
  document    = var.poweruser_role_requires_mfa ? local.assume_role_with_mfa_document : local.assume_role_document
  description = var.description
  force       = var.force
}

resource "alicloud_ram_role_policy_attachment" "poweruser" {
  count = var.create_poweruser_role && length(var.poweruser_role_policy_names) > 0 ? length(var.poweruser_role_policy_names) : 0

  role_name   = alicloud_ram_role.poweruser[0].name
  policy_name = element(var.poweruser_role_policy_names, count.index)
  policy_type = "System"
}

# Readonly
resource "alicloud_ram_role" "readonly" {
  count = var.create_readonly_role ? 1 : 0

  name        = local.readonly_role_name
  document    = var.readonly_role_requires_mfa ? local.assume_role_with_mfa_document : local.assume_role_document
  description = var.description
  force       = var.force
}

resource "alicloud_ram_role_policy_attachment" "readonly" {
  count = var.create_readonly_role && length(var.readonly_role_policy_names) > 0 ? length(var.readonly_role_policy_names) : 0

  role_name   = alicloud_ram_role.readonly[0].name
  policy_name = element(var.readonly_role_policy_names, count.index)
  policy_type = "System"
}