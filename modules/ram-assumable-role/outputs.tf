output "this_ram_role_arn" {
  description = "ARN of RAM role"
  value       = element(concat(alicloud_ram_role.this.*.arn, [""]), 0)
}

output "this_ram_role_name" {
  description = "Name of RAM role"
  value       = element(concat(alicloud_ram_role.this.*.name, [""]), 0)
}