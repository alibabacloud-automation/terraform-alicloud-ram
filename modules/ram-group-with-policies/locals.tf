locals {
  action   = jsonencode(var.action)
  effect   = jsonencode(var.effect)
  resource = jsonencode(var.resource)

  document = <<EOF
		{
		  "Statement": [
			{
			  "Action": ${local.action},
			  "Effect": ${local.effect},
			  "Resource": ${local.resource}
			}
		  ],
			"Version": "1"
		}
	  EOF
}