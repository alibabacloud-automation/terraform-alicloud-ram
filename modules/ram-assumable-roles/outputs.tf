# Admin
output "this_admin_ram_role_arn" {
  description = "ARN of admin RAM role"
  value       = element(concat(alicloud_ram_role.admin.*.arn, [""]), 0)
}

output "this_admin_ram_role_name" {
  description = "Name of admin RAM role"
  value       = element(concat(alicloud_ram_role.admin.*.name, [""]), 0)
}

# Poweruser
output "this_poweruser_ram_role_arn" {
  description = "ARN of poweruser RAM role"
  value       = element(concat(alicloud_ram_role.poweruser.*.arn, [""]), 0)
}

output "this_poweruser_ram_role_name" {
  description = "Name of admin RAM role"
  value       = element(concat(alicloud_ram_role.poweruser.*.name, [""]), 0)
}

# Readonly
output "this_readonly_ram_role_arn" {
  description = "ARN of readonly RAM role"
  value       = element(concat(alicloud_ram_role.readonly.*.arn, [""]), 0)
}

output "this_readonly_ram_role_name" {
  description = "Name of admin RAM role"
  value       = element(concat(alicloud_ram_role.readonly.*.name, [""]), 0)
}