variable "region" {
  description = "(Deprecated from version 1.7.0)The region used to launch this module resources."
  type        = string
  default     = ""
}

variable "profile" {
  description = "(Deprecated from version 1.7.0)The profile name as set in the shared credentials file. If not set, it will be sourced from the ALICLOUD_PROFILE environment variable."
  type        = string
  default     = ""
}
variable "shared_credentials_file" {
  description = "(Deprecated from version 1.7.0)This is the path to the shared credentials file. If this is not set and a profile is specified, $HOME/.aliyun/config.json will be used."
  type        = string
  default     = ""
}

variable "skip_region_validation" {
  description = "(Deprecated from version 1.7.0)Skip static validation of region ID. Used by users of alternative AlibabaCloud-like APIs or users w/ access to regions that are not public (yet)."
  type        = bool
  default     = false
}

#########################
# alicloud_ram_role
#########################
variable "admin_role_requires_mfa" {
  description = "Whether admin role requires MFA"
  type        = bool
  default     = true
}

variable "poweruser_role_requires_mfa" {
  description = "Whether poweruser role requires MFA"
  type        = bool
  default     = true
}

variable "readonly_role_requires_mfa" {
  description = "Whether readonly role requires MFA"
  type        = bool
  default     = true
}

variable "trusted_role_arns" {
  description = "ARNs of Alibaba Cloud entities who can assume these roles"
  type        = list(string)
  default     = []
}

variable "trusted_role_services" {
  description = "Alibaba Cloud Services that can assume these roles"
  type        = list(string)
  default     = []
}

variable "mfa_age" {
  description = "Max age of valid MFA (in seconds) for roles which require MFA"
  type        = number
  default     = 86400
}

variable "description" {
  description = "Description of the RAM role"
  type        = string
  default     = ""
}

variable "force" {
  description = "This parameter is used for resource destroy"
  type        = bool
  default     = false
}

variable "action" {
  description = "Operations on specific resources"
  type        = string
  default     = ""
}

#########################
# Admin
#########################
variable "create_admin_role" {
  description = "Whether to create admin role"
  type        = bool
  default     = false
}

variable "admin_role_name" {
  description = "RAM role with admin access. If not set, a default name with prefix `admin-role-` will be returned."
  type        = string
  default     = ""
}

variable "admin_role_policy_names" {
  description = "List of policy names to use for admin role"
  type        = list(string)
  default     = ["AliyunOSSFullAccess"]
}

#########################
# Poweruser
#########################
variable "create_poweruser_role" {
  description = "Whether to create poweruser role"
  type        = bool
  default     = false
}

variable "poweruser_role_name" {
  description = "RAM role with poweruser access. If not set, a default name with prefix `poweruser-role-` will be returned."
  type        = string
  default     = ""
}

variable "poweruser_role_policy_names" {
  description = "List of policy names to use for poweruser role"
  type        = list(string)
  default     = ["AliyunOSSFullAccess"]
}

#########################
# Readonly
#########################
variable "create_readonly_role" {
  description = "Whether to create readonly role"
  type        = bool
  default     = false
}

variable "readonly_role_name" {
  description = "RAM role with readonly access. If not set, a default name with prefix `readonly-role-` will be returned."
  type        = string
  default     = ""
}

variable "readonly_role_policy_names" {
  description = "List of policy names to use for readonly role"
  type        = list(string)
  default     = ["AliyunOSSReadOnlyAccess"]
}

