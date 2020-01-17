output "this_group_users" {
  description = "List of RAM users in RAM group"
  value       = module.ram_group_superadmins.this_group_users
}

output "this_group_name" {
  description = "RAM group name"
  value       = module.ram_group_superadmins.this_group_name
}

################################
# RAM ram_self_management policies
################################
output "this_ram_self_management_policy_name" {
  description = "RAM ram_self_management policy name"
  value       = module.ram_group_superadmins.this_ram_self_management_policy_name
}

output "this_ram_self_management_policy_description" {
  description = "Description of ram_self_management policy"
  value       = module.ram_group_superadmins.this_ram_self_management_policy_description
}

################################
# RAM custom policies
################################
output "this_custom_policy_name" {
  description = "RAM custom name"
  value       = module.ram_group_superadmins.this_custom_policy_name
}

output "this_custom_description" {
  description = "Description of custom policy"
  value       = module.ram_group_superadmins.this_custom_description
}
