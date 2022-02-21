data "alicloud_caller_identity" "this" {
  count = var.get_caller_identity ? 1 : 0
}

resource "random_uuid" "this" {
}

locals {
  alias = var.account_alias != "" ? var.account_alias : substr("ram-account-${replace(random_uuid.this.result, "-", "")}", 0, 32)
}

resource "alicloud_ram_account_alias" "this" {
  account_alias = local.alias
}

resource "alicloud_ram_account_password_policy" "this" {
  count = var.create_account_password_policy ? 1 : 0

  minimum_password_length      = lookup(var.ram_account_password_policy, "minimum_password_length")
  require_lowercase_characters = lookup(var.ram_account_password_policy, "require_lowercase_characters")
  require_uppercase_characters = lookup(var.ram_account_password_policy, "require_uppercase_characters")
  require_numbers              = lookup(var.ram_account_password_policy, "require_numbers")
  require_symbols              = lookup(var.ram_account_password_policy, "require_symbols")
  hard_expiry                  = lookup(var.ram_account_password_policy, "hard_expiry")
  max_password_age             = lookup(var.ram_account_password_policy, "max_password_age")
  password_reuse_prevention    = lookup(var.ram_account_password_policy, "password_reuse_prevention")
  max_login_attempts           = lookup(var.ram_account_password_policy, "max_login_attempts")
}