output "ram_account_id" {
  description = "RAM Alibaba Cloud account id (this code is managing resources in this account)"
  value       = data.alicloud_account.this.id
}

output "this_group_users" {
  description = "List of RAM users in RAM group"
  value       = module.ram_group_with_assumable_roles_policy_production_readonly.this_group_users
}

output "this_assumable_roles" {
  description = "List of ARNs of RAM roles which members of RAM group can assume"
  value       = module.ram_group_with_assumable_roles_policy_production_readonly.this_assumable_roles
}

output "this_policy_name" {
  description = "Assume role policy name for RAM group"
  value       = module.ram_group_with_assumable_roles_policy_production_readonly.this_policy_name
}