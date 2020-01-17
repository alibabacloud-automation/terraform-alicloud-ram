#########################
# Admin
#########################
output "this_admin_ram_role_arn" {
  description = "ARN of admin RAM role"
  value       = module.ram_assumable_roles.this_admin_ram_role_arn
}

output "this_admin_ram_role_name" {
  description = "Name of admin RAM role"
  value       = module.ram_assumable_roles.this_admin_ram_role_name
}

#########################
# Poweruser
#########################
output "this_poweruser_ram_role_arn" {
  description = "ARN of poweruser RAM role"
  value       = module.ram_assumable_roles.this_poweruser_ram_role_arn
}

output "this_poweruser_ram_role_name" {
  description = "Name of admin RAM role"
  value       = module.ram_assumable_roles.this_poweruser_ram_role_name
}

#########################
# Readonly
#########################
output "this_readonly_ram_role_arn" {
  description = "ARN of readonly RAM role"
  value       = module.ram_assumable_roles.this_readonly_ram_role_arn
}

output "this_readonly_ram_role_name" {
  description = "Name of admin RAM role"
  value       = module.ram_assumable_roles.this_readonly_ram_role_name
}
