# RAM assumable roles example

Configuration in this directory creates several individual RAM roles which can be assumed from a defined list of RAM ARNs.


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
| this_admin_ram_role_arn | ARN of admin RAM role |
| this_admin_ram_role_name | Name of admin RAM role |
| this_poweruser_ram_role_arn | ARN of poweruser RAM role |
| this_poweruser_ram_role_name | Name of admin RAM role |
| this_readonly_ram_role_arn | ARN of readonly RAM role |
| this_readonly_ram_role_name | Name of admin RAM role |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
