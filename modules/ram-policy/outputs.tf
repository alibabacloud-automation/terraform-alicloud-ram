output "this_ram_policy_name" {
  description = "The policy name"
  value       = element(concat(alicloud_ram_policy.this.*.name, [""]), 0)
}

output "this_ram_policy_attachment_count" {
  description = "The policy attachment count"
  value       = alicloud_ram_policy.this.attachment_count
}

output "this_ram_policy_type" {
  description = "The policy type"
  value       = alicloud_ram_policy.this.type
}

output "this_ram_policy_description" {
  description = "The policy description"
  value       = alicloud_ram_policy.this.description
}

output "this_ram_policy_version" {
  description = "The policy document version"
  value       = alicloud_ram_policy.this.version
}