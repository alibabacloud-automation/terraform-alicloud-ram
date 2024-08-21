locals {
  role_name = var.role_name != "" ? var.role_name : substr("ram-assumable-role-${replace(random_uuid.this.result, "-", "")}", 0, 32)

  action                = jsonencode(var.action)
  trusted_role_arns     = jsonencode(var.trusted_role_arns)
  trusted_role_services = jsonencode(var.trusted_role_services)
  mfa_age               = jsonencode(var.mfa_age)

  assume_role_document = <<EOF
		{
            "Statement": [
                {
                    "Action": ${local.action},
                    "Effect": "Allow",
                    "Principal": {
                        "RAM": ${local.trusted_role_arns},
                        "Service": ${local.trusted_role_services}
                    }
                }
            ],
              "Version": "1"
		}
	  EOF

  assume_role_with_mfa_document = <<EOF
		{
             "Statement": [
                {
                    "Action": ${local.action},
                    "Effect": "Allow",
                    "Principal": {
                        "RAM": ${local.trusted_role_arns},
                        "Service": ${local.trusted_role_services}
                    },
                    "Condition": {
                        "Bool": {
                            "acs:MFAPresent": ["true"]
                        }
                    }
                }
            ],
              "Version": "1"
		}
	  EOF
}