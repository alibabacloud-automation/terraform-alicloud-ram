# RAM group with policies example

Configuration in this directory creates RAM group with users who has specified RAM policies.


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
| this_group_users | List of RAM users in RAM group |
| this_group_name | RAM group name |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
