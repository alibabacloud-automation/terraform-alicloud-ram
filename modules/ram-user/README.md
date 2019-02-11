# ram-user

Creates RAM user, RAM login profile, RAM access key.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| create_ram_access_key | Whether to create RAM access key | string | `true` | no |
| create_ram_user_login_profile | Whether to create RAM user login profile | string | `true` | no |
| create_user | Whether to create the RAM user | string | `true` | no |
| force_destroy | When destroying this user, destroy even if it has non-Terraform-managed RAM access keys, login profile or MFA devices. Without force_destroy a user with non-Terraform-managed access keys and login profile will fail to be destroyed. | string | `false` | no |
| name | User name for the RAM user | string | - | yes |
| password | Password for the RAM user | string | - | yes |
| secret_file | Path of file which stores the access secret  | string | "secret.txt"| no |

## Outputs

| Name | Description |
|------|-------------|
| this_ram_access_key_id | The access key ID |
| this_ram_user_name | The user's name |
| this_ram_user_unique_id | The unique ID assigned by AWS |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
