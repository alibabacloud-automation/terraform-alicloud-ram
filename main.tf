resource "alicloud_ram_user" "this" {
  name  = "${var.name}"
  force = "${var.force_destroy}"
}

resource "alicloud_ram_login_profile" "this" {
  count     = "${var.create_ram_user_login_profile ? 1 : 0}"
  user_name = "${alicloud_ram_user.this.name}"
  password  = "${var.password}"
}

resource "alicloud_ram_access_key" "this" {
  count       = "${var.create_ram_access_key ? 1 : 0}"
  user_name   = "${alicloud_ram_user.this.name}"
  secret_file = "${var.secret_file}"
}

data "alicloud_ram_policies" "admin" {
  name_regex = "^AdministratorAccess$"
  type       = "System"
}

data "alicloud_ram_policies" "reader" {
  name_regex = "^ReadOnlyAccess$"
  type       = "System"
}

resource "alicloud_ram_user_policy_attachment" "attach1" {
  count       = "${var.is_admin?1:0}"
  policy_name = "${data.alicloud_ram_policies.admin.policies.0.name}"
  policy_type = "System"
  user_name   = "${alicloud_ram_user.this.name}"
}

resource "alicloud_ram_user_policy_attachment" "attach2" {
  count       = "${var.is_reader?1:0}"
  policy_name = "${data.alicloud_ram_policies.reader.policies.0.name}"
  policy_type = "System"
  user_name   = "${alicloud_ram_user.this.name}"
}
