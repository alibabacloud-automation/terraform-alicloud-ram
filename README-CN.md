# 下线公告

感谢您对阿里云 Terraform Module 的关注。即日起，本 Module 将停止维护并会在将来正式下线。推荐您使用 [ram-user](https://registry.terraform.io/modules/terraform-alicloud-modules/ram-user/alicloud/latest)，[ram-role](https://registry.terraform.io/modules/terraform-alicloud-modules/ram-role/alicloud/latest)，[ram-policy](https://registry.terraform.io/modules/terraform-alicloud-modules/ram-policy/alicloud/latest) 作为替代方案。更多丰富的 Module 可在 [阿里云 Terraform Module](https://registry.terraform.io/browse/modules?provider=alibaba) 中搜索获取。

再次感谢您的理解和合作。

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

## Terraform 版本

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
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

## 注意事项
本Module从版本v1.3.0开始已经移除掉如下的 provider 的显式设置：
```hcl
provider "alicloud" {
  version = ">=1.56.0"
  region = var.region != "" ? var.region : null
  configuration_source = "terraform-alicloud-modules/ram"
} 
```

如果你依然想在Module中使用这个 provider 配置，你可以在调用Module的时候，指定一个特定的版本，比如 1.2.0:

```hcl
module "ram" {
  source = "terraform-alicloud-modules/ram/alicloud"
  version     = "1.2.0"
  region      = "cn-hangzhou"
  profile     = "Your-Profile-Name"

  name = "terraformtest1"
  is_reader = true
}
```
如果你想对正在使用中的Module升级到 1.3.0 或者更高的版本，那么你可以在模板中显式定义一个相同Region的provider：
```hcl
provider "alicloud" {
  region  = "cn-hangzhou"
  profile = "Your-Profile-Name"
}
module "ram" {
  source = "terraform-alicloud-modules/ram/alicloud"
  name = "terraformtest1"
  is_reader = true
}
```
或者，如果你是多Region部署，你可以利用 `alias` 定义多个 provider，并在Module中显式指定这个provider：

```hcl
provider "alicloud" {
  region  = "cn-hangzhou"
  profile = "Your-Profile-Name"
  alias   = "hz"
}
module "ram" {
  source = "terraform-alicloud-modules/ram/alicloud"
  providers = {
    alicloud = alicloud.hz
  }
  name = "terraformtest2"
  is_reader = true
}
```

定义完provider之后，运行命令 `terraform init` 和 `terraform apply` 来让这个provider生效即可。

更多provider的使用细节，请移步[How to use provider in the module](https://www.terraform.io/docs/language/modules/develop/providers.html#passing-providers-explicitly)

## 作者

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

## 许可

Apache 2 Licensed. See LICENSE for full details.