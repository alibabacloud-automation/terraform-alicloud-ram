provider "alicloud" {
  version                 = ">=1.64.0"
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/ram-user"
}

resource "random_uuid" "this" {}

locals {
  name = var.name != "" ? var.name : substr("ram-user-${replace(random_uuid.this.result, "-", "")}", 0, 32)
}


#########################
# RAM user
#########################
resource "alicloud_ram_user" "this" {
  count = var.create_user ? 1 : 0

  name         = local.name
  display_name = var.display_name != "" ? var.display_name : null
  mobile       = var.mobile != "" ? var.mobile : null
  email        = var.email != "" ? var.email : null
  force        = var.force
  comments     = var.comments != "" ? var.comments : null
}

#########################
# RAM login profile
#########################
resource "alicloud_ram_login_profile" "this" {
  count = var.create_user && var.create_ram_user_login_profile ? 1 : 0

  password                = var.password
  user_name               = alicloud_ram_user.this[count.index].name
  password_reset_required = var.password_reset_required
  mfa_bind_required       = var.mfa_bind_required
}

#########################
# RAM access key
#########################
resource "alicloud_ram_access_key" "this" {
  count = var.create_user && var.create_ram_access_key && var.pgp_key != "" ? 1 : 0

  secret_file = var.secret_file != "" ? var.secret_file : null
  status      = var.status
  pgp_key     = var.pgp_key != "" ? var.pgp_key : null
}

resource "alicloud_ram_access_key" "this_no_pgp" {
  count = var.create_user && var.create_ram_access_key ? 1 : 0

  secret_file = var.secret_file != "" ? var.secret_file : null
  status      = var.status
}
