resource "random_uuid" "this" {}

locals {
  user_name = var.name != "" ? var.name : substr("ram-user-${replace(random_uuid.this.result, "-", "")}", 0, 32)
}

################################
# RAM user
################################
resource "alicloud_ram_user" "this" {
  count = var.create_user ? 1 : 0
  name  = local.user_name
  force = var.force_destroy
}

################################
# RAM login profile
################################
resource "alicloud_ram_login_profile" "this" {
  count     = var.create_ram_user_login_profile ? 1 : 0

  user_name = local.user_name
  password  = var.password
}

################################
# RAM access key
################################
resource "alicloud_ram_access_key" "this" {
  count         = var.create_ram_access_key ? 1 : 0

  user_name     = local.user_name
  secret_file   = var.secret_file
}

################################
# RAM ram lopicies
################################
data "alicloud_ram_policies" "admin" {
  name_regex = "^AdministratorAccess$"
  type       = "System"
}

data "alicloud_ram_policies" "reader" {
  name_regex = "^ReadOnlyAccess$"
  type       = "System"
}

################################
# RAM user policy attachment
################################
resource "alicloud_ram_user_policy_attachment" "attach1" {
  count       = var.is_admin ? 1 : 0
  policy_name = data.alicloud_ram_policies.admin.policies[0].name
  policy_type = "System"
  user_name   = local.user_name
}

resource "alicloud_ram_user_policy_attachment" "attach2" {
  count       = var.is_reader ? 1 : 0
  policy_name = data.alicloud_ram_policies.reader.policies[0].name
  policy_type = "System"
  user_name   = local.user_name
}
