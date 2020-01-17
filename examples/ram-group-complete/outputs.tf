output "this_group_users" {
  description = "List of RAM users in RAM group"
  value       = module.ram_group_complete.this_group_users
}

output "this_assumable_roles" {
  description = "List of ARNs of RAM roles which members of RAM group can assume"
  value       = module.ram_group_complete.this_assumable_roles
}

output "this_policy_name" {
  description = "Assume role policy name for RAM group"
  value       = module.ram_group_complete.this_policy_name
}
