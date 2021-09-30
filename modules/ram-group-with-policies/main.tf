provider "alicloud" {
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/ram-group-with-policies"
}

resource "random_uuid" "this" {}

locals {
  name       = var.name != "" ? var.name : substr("ram-group-${replace(random_uuid.this.result, "-", "")}", 0, 32)
  group_name = element(concat(alicloud_ram_group.this.*.name, [var.name]), 0)
}

################################
# RAM group
################################
resource "alicloud_ram_group" "this" {
  count = var.create_group ? 1 : 0

  name     = var.name
  comments = var.comments != "" ? var.comments : null
  force    = var.force
}

################################
# RAM group membership
################################
resource "alicloud_ram_group_membership" "this" {
  count = length(var.user_names) > 0 ? 1 : 0

  group_name = local.group_name
  user_names = var.user_names
}

################################
# RAM group policy attachements
################################
resource "alicloud_ram_group_policy_attachment" "ram_self_management" {
  count = var.attach_ram_self_management_policy ? 1 : 0

  group_name  = local.group_name
  policy_name = alicloud_ram_policy.ram_self_management[0].name
  policy_type = var.policy_type
}

resource "alicloud_ram_group_policy_attachment" "custom_names" {
  count = length(var.custom_group_policy_names) > 0 ? length(var.custom_group_policy_names) : 0

  group_name  = local.group_name
  policy_name = element(var.custom_group_policy_names, count.index)
  policy_type = var.policy_type
}

resource "alicloud_ram_group_policy_attachment" "custom" {
  count = length(var.custom_group_policies) > 0 ? length(var.custom_group_policies) : 0

  group_name  = local.group_name
  policy_name = element(alicloud_ram_policy.custom.*.name, count.index)
  policy_type = var.policy_type
}

################################
# RAM policies
################################
resource "alicloud_ram_policy" "ram_self_management" {
  count = var.attach_ram_self_management_policy ? 1 : 0

  name        = var.name
  document    = local.document
  description = var.description != "" ? var.description : null
  force       = var.force
}

resource "alicloud_ram_policy" "custom" {
  count = length(var.custom_group_policies) > 0 ? length(var.custom_group_policies) : 0

  name        = var.custom_group_policies[count.index].name
  document    = var.custom_group_policies[count.index].document
  description = var.description != "" ? var.description : null
  force       = var.force
}
