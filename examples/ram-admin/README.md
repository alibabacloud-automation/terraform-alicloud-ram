# RAM admin example

Configuration in this directory creates RAM user with specified password, a pair of access key and access secret, which will be stored in './secret.txt'. This user will be attached with system managed AdministratorAccess policy.


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
| this_ram_access_key_id | The access key ID |
| this_ram_user_name | The user's name |
| this_ram_user_unique_id | The unique ID assigned by Alibaba Cloud |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
