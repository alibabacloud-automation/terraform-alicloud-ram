# RAM assumable role example

Configuration in this directory creates several individual RAM roles which can be assumed from a defined list of RAM ARNs.

The main difference between `ram-assumable-role` and `ram-assumable-roles` examples is that the former creates just a single role.

# Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Run `terraform destroy` when you don't need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Outputs
| Name | Description |
|------|-------------|
| this_ram_role_admin_name | Name of RAM role |
| this_ram_role_admin_arn | ARN of RAM role |
| this_ram_role_custom_name | Name of RAM role |
| this_ram_role_custom_arn | ARN of RAM role |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
