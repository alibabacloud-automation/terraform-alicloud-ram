output "this_ram_user_name" {
  description = "The user's name"
  value       = "${module.ram_admin.this_ram_user_name}"
}

output "this_ram_user_unique_id" {
  description = "The unique ID assigned by AWS"
  value       = "${module.ram_admin.this_ram_user_unique_id}"
}

output "this_ram_access_key_id" {
  description = "The access key ID"
  value       = "${module.ram_admin.this_ram_access_key_id}"
}
