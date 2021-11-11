resource "random_uuid" "this" {}

resource "alicloud_ram_policy" "this" {
  name        = local.policy_name
  description = "Allows to assume role in another Alibaba Cloud account"
  document    = local.document
  force       = var.force
}

resource "alicloud_ram_group" "this" {
  name = local.group_name
}

resource "alicloud_ram_group_policy_attachment" "this" {
  group_name  = alicloud_ram_group.this.name
  policy_name = alicloud_ram_policy.this.name
  policy_type = "Custom"
}

resource "alicloud_ram_group_membership" "this" {
  count = length(var.user_names) > 0 ? 1 : 0

  group_name = alicloud_ram_group.this.name
  user_names = var.user_names
}