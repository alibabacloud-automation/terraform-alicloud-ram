# Alicloud Resource Access Management (RAM) Terraform module

These types of resources are supported:

* [RAM user](https://www.terraform.io/docs/providers/alicloud/r/ram_user.html)
* [RAM user login profile](https://www.terraform.io/docs/providers/alicloud/r/ram_login_profile.html)
* [RAM access key](https://www.terraform.io/docs/providers/alicloud/r/ram_access_key.html)
* [RAM account alias](https://www.terraform.io/docs/providers/alicloud/r/ram_account_alias.html)
* [RAM account password policy](https://www.terraform.io/docs/providers/alicloud/r/ram_account_password_policy.html)
* [RAM group](https://www.terraform.io/docs/providers/alicloud/r/ram_group.html)
* [RAM group membership](https://www.terraform.io/docs/providers/alicloud/r/ram_group_membership.html)
* [RAM group policy attachment](https://www.terraform.io/docs/providers/alicloud/r/ram_group_policy_attachment.html)
* [RAM role](https://www.terraform.io/docs/providers/alicloud/r/ram_role.html)
* [RAM role attachment](https://www.terraform.io/docs/providers/alicloud/r/ram_role_attachment.html)
* [RAM user policy attachment](https://www.terraform.io/docs/providers/alicloud/r/ram_user_policy_attachment.html)


## Terraform versions

For Terraform 0.12 use this module and Terraform Provider AliCloud 1.56.0+.

## Terraform versions

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.56.0

## Usage

### create a new ram user

Create a ram user without any access permission
```hcl
module "ram_user" {
   source = "terraform-alicloud-modules/ram/alicloud"
   name = "terraformtest1"
 }
```

Setting `create_ram_user_login_profile` to true can allow the ram user login the web console

```hcl
module "ram_user" {
   source = "terraform-alicloud-modules/ram/alicloud"

   name = "terraformtest1"
   create_ram_user_login_profile = true
   password = "123X_xxxx"
 }
```

Setting `create_ram_access_key` to true can allocate a access key and secret key to the ram user
, and them will store into the default secret file `secret.txt`

```hcl
module "ram_user" {
   source = "terraform-alicloud-modules/ram/alicloud"

   name = "terraformtest1"
   create_ram_access_key = true
 }
```

### create a new ram user with some access permission

Create a ram admin

```hcl
module "ram_user" {
   source = "terraform-alicloud-modules/ram/alicloud"

   name = "terraformtest1"
   is_admin = true
 }
```

Create a ram user with read-only permission

```hcl
module "ram_user" {
   source = "terraform-alicloud-modules/ram/alicloud"

   name = "terraformtest1"
   is_reader = true
 }
```

## SubModules

* [ram-user module](https://github.com/terraform-alicloud-modules/terraform-alicloud-ram/tree/master/modules/ram-user)
* [ram-policy module](https://github.com/terraform-alicloud-modules/terraform-alicloud-ram/tree/master/modules/ram-policy)
* [ram-group-with-policies module](https://github.com/terraform-alicloud-modules/terraform-alicloud-ram/tree/master/modules/ram-group-with-policies)
* [ram-account module](https://github.com/terraform-alicloud-modules/terraform-alicloud-ram/tree/master/modules/ram-account)
* [ram-assumable-role module](https://github.com/terraform-alicloud-modules/terraform-alicloud-ram/tree/master/modules/ram-assumable-role)
* [ram-assumable-roles module](https://github.com/terraform-alicloud-modules/terraform-alicloud-ram/tree/master/modules/ram-assumable-roles)
* [ram-group-with-assumable-roles-policy module](https://github.com/terraform-alicloud-modules/terraform-alicloud-ram/tree/master/modules/ram-group-with-assumable-roles-policy)

## Examples

* [ram-user example](https://github.com/terraform-alicloud-modules/terraform-alicloud-ram/tree/master/examples/ram-user) - Add RAM user, login profile and access keys.
* [ram-admin example](https://github.com/terraform-alicloud-modules/terraform-alicloud-ram/tree/master/examples/ram-admin) - Add RAM user with administrator previlleage, login profile and access keys.
* [ram-policy example](https://github.com/terraform-alicloud-modules/terraform-alicloud-ram/tree/master/examples/ram-policy) - Create Alicloud Resource Access Management (RAM) User Terraform module 
* [ram-group-with-policies example](https://github.com/terraform-alicloud-modules/terraform-alicloud-ram/tree/master/examples/ram-group-with-policies) - Creates RAM group with specified RAM policies, and add users into a group.
* [ram-account example](https://github.com/terraform-alicloud-modules/terraform-alicloud-ram/tree/master/examples/ram-account) - Manage RAM account alias and password policy.
* [ram-assumable-role example](https://github.com/terraform-alicloud-modules/terraform-alicloud-ram/tree/master/examples/ram-assumable-role) - Add RAM role.
* [ram-assumable-roles example](https://github.com/terraform-alicloud-modules/terraform-alicloud-ram/tree/master/examples/ram-assumable-roles) - - Add RAM roles.
* [ram-group-with-assumable-roles-policy example](https://github.com/terraform-alicloud-modules/terraform-alicloud-ram/tree/master/examples/ram-group-with-assumable-roles-policy) - Create RAM groups with users who are allowed to assume RAM roles.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Notes
From the version v1.9.0, the module has removed the following `provider` setting:

```hcl
provider "alicloud" {
  profile                 = var.profile != "" ? var.profile : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
}
```

If you still want to use the `provider` setting to apply this module, you can specify a supported version, like 1.8.0:

```hcl
module "vpc" {
  source  = "alibaba/ram/alicloud"
  version     = "1.8.0"
  region      = "cn-hangzhou"
  profile     = "Your-Profile-Name"
  
  create            = true
  vpc_name          = "my-env-ram"
  // ...
}
```

If you want to upgrade the module to 1.9.0 or higher in-place, you can define a provider which same region with
previous region:

```hcl
provider "alicloud" {
   region  = "cn-hangzhou"
   profile = "Your-Profile-Name"
}
module "ram" {
  source  = "alibaba/ram/alicloud"
  create            = true
  vpc_name          = "my-env-ram"
  // ...
}
```

and then run `terraform init` and `terraform apply` to make the defined provider effect to the existing module state.
More details see [How to use provider in the module](https://www.terraform.io/docs/language/modules/develop/providers.html#passing-providers-explicitly)

## Authors

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

## License

Apache 2 Licensed. See LICENSE for full details.
