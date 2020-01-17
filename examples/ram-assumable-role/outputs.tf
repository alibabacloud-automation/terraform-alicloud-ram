output "this_ram_role_admin_name" {
  description = "Name of RAM role"
  value       = module.ram_assumable_role_admin.this_ram_role_name
}

output "this_ram_role_admin_arn" {
  description = "ARN of RAM role"
  value       = module.ram_assumable_role_admin.this_ram_role_arn
}

output "this_ram_role_custom_name" {
  description = "Name of RAM role"
  value       = module.ram_assumable_role_custom.this_ram_role_name
}

output "this_ram_role_custom_arn" {
  description = "ARN of RAM role"
  value       = module.ram_assumable_role_custom.this_ram_role_arn
}