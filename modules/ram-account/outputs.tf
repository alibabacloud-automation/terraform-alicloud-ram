output "this_caller_identity_account_id" {
  description = "The Alicloud Account ID number of the account that owns or contains the calling entity"
  value       = element(concat(data.alicloud_caller_identity.this.*.id, [""]), 0)
}

output "this_ram_account_alias" {
  description = "Alias of alicloud account."
  value       = alicloud_ram_account_alias.this.*.account_alias
}