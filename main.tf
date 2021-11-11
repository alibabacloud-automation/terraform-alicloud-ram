resource "random_uuid" "this" {}

locals {
  name = var.name != "" ? var.name : substr("ram-user-${replace(random_uuid.this.result, "-", "")}", 0, 32)
}

################################
# RAM user
################################
resource "alicloud_ram_user" "this" {
  name  = local.name
  force = var.force_destroy
}

################################
# RAM login profile
################################
resource "alicloud_ram_login_profile" "this" {
  count = var.create_ram_user_login_profile ? 1 : 0

  user_name = alicloud_ram_user.this.name
  password  = var.password
}

################################
# RAM access key
################################
resource "alicloud_ram_access_key" "this" {
  count = var.create_ram_access_key ? 1 : 0

  user_name   = alicloud_ram_user.this.name
  secret_file = var.secret_file
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
  user_name   = alicloud_ram_user.this.name
}

resource "alicloud_ram_user_policy_attachment" "attach2" {
  count       = var.is_reader ? 1 : 0
  policy_name = data.alicloud_ram_policies.reader.policies[0].name
  policy_type = "System"
  user_name   = alicloud_ram_user.this.name
}

