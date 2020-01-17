##############
# RAM account
##############
module "ram_account" {
  source = "../../modules/ram-account"

  account_alias = "new-test-account-alisome-company"

  ram_account_password_policy = {
    minimum_password_length      = 12
    require_lowercase_characters = true
    require_uppercase_characters = true
    require_numbers              = true
    require_symbols              = true
    hard_expiry                  = false
    max_password_age             = 0
    password_reuse_prevention    = 0
    max_login_attempts           = 5
  }
}