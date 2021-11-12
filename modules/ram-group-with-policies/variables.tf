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

variable "name" {
  description = "Name of the RAM group. If not set, a default name with prefix `ram-group-` will be returned."
  type        = string
  default     = ""
}

variable "comments" {
  description = "Comment of the RAM group"
  type        = string
  default     = ""
}

variable "force" {
  description = "This parameter is used for resource destroy"
  type        = bool
  default     = false
}

variable "user_names" {
  description = "Set of user name which will be added to group"
  type        = set(string)
}

variable "policy_type" {
  description = "Type of the RAM policy"
  type        = string
  default     = "System"
}

variable "create_group" {
  description = "Whether to create RAM group"
  type        = bool
  default     = true
}

variable "attach_ram_self_management_policy" {
  description = "Whether to attach RAM policy which allows RAM users to manage their credentials and MFA"
  type        = bool
  default     = true
}

variable "custom_group_policy_names" {
  description = "List of RAM policies names to attach to RAM group"
  type        = list(string)
  default     = []
}

variable "custom_group_policies" {
  description = "List of maps of inline RAM policies to attach to RAM group. Should have `name` and `documnet` keys in each element."
  type        = list(map(string))
  default     = []
}

variable "description" {
  description = "Description of the RAM policy"
  type        = string
  default     = ""
}

variable "action" {
  description = "Operations on specific resources"
  type        = list(string)
  default     = []
}

variable "effect" {
  description = "Authorization includes two types: Allow and Deny"
  type        = string
  default     = ""
}

variable "resource" {
  description = "Authorized Specific Object"
  type        = list(string)
  default     = []
}
