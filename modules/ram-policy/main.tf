resource "random_uuid" "this" {
}

locals {
  name = var.name != "" ? var.name : substr("ram-policy-${replace(random_uuid.this.result, "-", "")}", 0, 32)
}

resource "alicloud_ram_policy" "this" {
  policy_name     = local.name
  policy_document = var.document
  description     = var.description != "" ? var.description : null
  force           = var.force
}