provider "alicloud" {
  version                 = ">=1.64.0"
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/ram-policy"
}

resource "random_uuid" "this" {}

locals {
  name = var.name != "" ? var.name : substr("ram-policy-${replace(random_uuid.this.result, "-", "")}", 0, 32)
}


resource "alicloud_ram_policy" "this" {
  name        = local.name
  document    = var.document
  description = var.description != "" ? var.description : null
  force       = var.force
}

