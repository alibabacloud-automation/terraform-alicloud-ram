variable "region" {
  description = "(Deprecated from version 1.3.0)The region used to launch this module resources."
  type        = string
  default     = ""
}

variable "profile" {
  description = "(Deprecated from version 1.3.0)The profile name as set in the shared credentials file. If not set, it will be sourced from the ALICLOUD_PROFILE environment variable."
  type        = string
  default     = ""
}
variable "shared_credentials_file" {
  description = "(Deprecated from version 1.3.0)This is the path to the shared credentials file. If this is not set and a profile is specified, $HOME/.aliyun/config.json will be used."
  type        = string
  default     = ""
}

variable "skip_region_validation" {
  description = "(Deprecated from version 1.3.0)Skip static validation of region ID. Used by users of alternative AlibabaCloud-like APIs or users w/ access to regions that are not public (yet)."
  type        = bool
  default     = false
}

# alicloud_ram_role
variable "create_role" {
  description = "Whether to create a role"
  type        = bool
  default     = false
}

variable "role_name" {
  description = "Name of the RAM role. If not set, a default name with prefix `ram-assumable-role-` will be returned."
  type        = string
  default     = ""
}

variable "role_requires_mfa" {
  description = "Whether role requires MFA"
  type        = bool
  default     = true
}

variable "action" {
  description = "Operations on specific resources"
  type        = string
  default     = ""
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

# alicloud_ram_role_policy_attachment
variable "custom_role_policy_names" {
  description = "List of ARNs of RAM policies to attach to RAM role"
  type        = list(string)
  default     = []
}

#alicloud_ram_role_policy_attachment
variable "attach_admin_policy" {
  description = "Whether to attach an admin policy to a role"
  type        = bool
  default     = false
}

variable "attach_poweruser_policy" {
  description = "Whether to attach a poweruser policy to a role"
  type        = bool
  default     = false
}

variable "attach_readonly_policy" {
  description = "Whether to attach a readonly policy to a role"
  type        = bool
  default     = false
}

variable "admin_role_policy_name" {
  description = "Policy ARN to use for admin role"
  type        = string
  default     = ""
}

variable "power_role_policy_name" {
  description = "Policy ARN to use for poweruser role"
  type        = string
  default     = ""
}

variable "readonly_role_policy_name" {
  description = "Policy ARN to use for readonly role"
  type        = string
  default     = ""
}