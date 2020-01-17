# RAM group with assumable roles policy example

Configuration in this directory creates RAM group with users who are allowed to assume RAM roles.


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
| ram_account_id | RAM Alibaba Cloud account id |
| this_group_users | List of RAM users in RAM group |
| this_assumable_roles | List of ARNs of RAM roles which members of RAM group can assume |
| this_policy_name | Assume role policy name for RAM group |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
