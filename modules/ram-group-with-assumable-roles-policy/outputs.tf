output "this_group_users" {
  description = "List of RAM users in RAM group"
  value       = flatten(alicloud_ram_group_membership.this.*.user_names)
}

output "this_assumable_roles" {
  description = "List of ARNs of RAM roles which members of RAM group can assume"
  value       = var.assumable_roles
}

output "this_policy_name" {
  description = "Assume role policy ARN of RAM group"
  value       = alicloud_ram_policy.this.name
}

output "this_group_name" {
  description = "RAM group name"
  value       = alicloud_ram_group.this.name
}