output "this_ram_user_name" {
  description = "The user's name"
  value       = "${element(concat(alicloud_ram_user.this.*.name, list("")), 0)}"
}

output "this_ram_user_unique_id" {
  description = "The unique ID assigned by alicloud"
  value       = "${element(concat(alicloud_ram_user.this.*.id, list("")), 0)}"
}

output "this_ram_access_key_id" {
  description = "The access key ID"
  value       = "${element(concat(alicloud_ram_access_key.this.*.id, list("")), 0)}"
}
