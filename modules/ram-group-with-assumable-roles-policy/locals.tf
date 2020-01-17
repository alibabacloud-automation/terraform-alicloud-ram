locals {
  policy_name = var.policy_name != "" ? var.policy_name : substr("assumable-roles-policy-${replace(random_uuid.this.result, "-", "")}", 0, 32)
  group_name  = var.group_name != "" ? var.group_name : substr("group-assumable-roles-${replace(random_uuid.this.result, "-", "")}", 0, 32)

  action          = jsonencode(var.action)
  assumable_roles = jsonencode(var.assumable_roles)

  document = <<EOF
		{
            "Statement": [
                {
                    "Action": ${local.action},
                    "Effect": "Allow",
                    "Resource": ${local.assumable_roles}
                }
            ],
              "Version": "1"
		}
	  EOF
}