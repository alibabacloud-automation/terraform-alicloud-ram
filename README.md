# Alicloud Resource Access Management (RAM) Terraform module

These types of resources are supported:

* [IAM user](https://www.terraform.io/docs/providers/aws/r/iam_user.html)
* [IAM user login profile](https://www.terraform.io/docs/providers/aws/r/iam_user_login_profile.html)
* [IAM access key](https://www.terraform.io/docs/providers/aws/r/iam_access_key.html)

## Usage


`iam-user`:
```hcl
module "ram_user" {
  source = "../../modules/ram-user"

  name = "terraformtest1"

  password = "USer@123"
}

```


## Examples

* [iam-user](https://github.com/terraform-alicloud-modules/terraform-alicloud-ram/tree/master/examples/ram-user) - Add IAM user, login profile and access keys

* [iam-admin](https://github.com/terraform-alicloud-modules/terraform-alicloud-ram/tree/master/examples/ram-admin) - Add IAM user with administrator previlleage, login profile and access keys

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Authors

Module managed by [Yunlong Chen](chenyunlong@msn.com).

## License

Apache 2 Licensed. See LICENSE for full details.
