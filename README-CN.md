# Alicloud Resource Access Management (RAM) Terraform module

支持创建以下类型的资源：

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

## 注意事项
本Module从版本v1.9.0开始已经移除掉如下的 provider 的显示设置：
```hcl
provider "alicloud" {
  profile                 = var.profile != "" ? var.profile : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
}
```
定义完provider之后，运行命令 `terraform init` 和 `terraform apply` 来让这个provider生效即可。

更多provider的使用细节，请移步[How to use provider in the module](https://www.terraform.io/docs/language/modules/develop/providers.html#passing-providers-explicitly)

## Terraform 版本

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.56.0

## 用法

### 创建一个RAM用户

#### 创建没有任何访问权限的ram用户

```hcl
module "ram_user" {
   source = "terraform-alicloud-modules/ram/alicloud"
   name = "terraformtest1"
 }
```

#### 将create_ram_user_login_profile设置为true可以允许ram用户登录Web控制台

```hcl
module "ram_user" {
   source = "terraform-alicloud-modules/ram/alicloud"

   name = "terraformtest1"
   create_ram_user_login_profile = true
   password = "123X_xxxx"
 }
```

#### 将create_ram_access_key设置为true可以为ram用户分配访问密钥和秘密密钥，它们将存储到默认的秘密文件“ secret.txt”中

```hcl
module "ram_user" {
   source = "terraform-alicloud-modules/ram/alicloud"

   name = "terraformtest1"
   create_ram_access_key = true
 }
```

#### 创建具有访问权限的新ram用户

创建一个ram管理员

```hcl
module "ram_user" {
   source = "terraform-alicloud-modules/ram/alicloud"

   name = "terraformtest1"
   is_admin = true
 }
```

创建具有只读权限的ram用户

```hcl
module "ram_user" {
   source = "terraform-alicloud-modules/ram/alicloud"

   name = "terraformtest1"
   is_reader = true
 }
```

## 子模板

* [ram-user module](https://github.com/terraform-alicloud-modules/terraform-alicloud-ram/tree/master/modules/ram-user)
* [ram-policy module](https://github.com/terraform-alicloud-modules/terraform-alicloud-ram/tree/master/modules/ram-policy)
* [ram-group-with-policies module](https://github.com/terraform-alicloud-modules/terraform-alicloud-ram/tree/master/modules/ram-group-with-policies)
* [ram-account module](https://github.com/terraform-alicloud-modules/terraform-alicloud-ram/tree/master/modules/ram-account)
* [ram-assumable-role module](https://github.com/terraform-alicloud-modules/terraform-alicloud-ram/tree/master/modules/ram-assumable-role)
* [ram-assumable-roles module](https://github.com/terraform-alicloud-modules/terraform-alicloud-ram/tree/master/modules/ram-assumable-roles)
* [ram-group-with-assumable-roles-policy module](https://github.com/terraform-alicloud-modules/terraform-alicloud-ram/tree/master/modules/ram-group-with-assumable-roles-policy)


## 示例

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

## 作者

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

## 许可

Apache 2 Licensed. See LICENSE for full details.
