output "this_group_users" {
  description = "List of RAM users in RAM group"
  value       = flatten(alicloud_ram_group_membership.this.*.user_names)
}

output "this_group_name" {
  description = "RAM group name"
  value       = element(concat(alicloud_ram_group.this.*.name, [var.name]), 0)
}

# RAM ram_self_management policies
output "this_ram_self_management_policy_name" {
  description = "RAM ram_self_management policy name"
  value       = concat(alicloud_ram_policy.ram_self_management.*.name, [""])
}

output "this_ram_self_management_policy_description" {
  description = "Description of ram_self_management policy"
  value       = concat(alicloud_ram_policy.ram_self_management.*.description, [""])
}

# RAM custom policies
output "this_custom_policy_name" {
  description = "RAM custom name"
  value       = concat(alicloud_ram_policy.custom.*.name, [""])
}

output "this_custom_description" {
  description = "Description of custom policy"
  value       = concat(alicloud_ram_policy.custom.*.description, [""])
}