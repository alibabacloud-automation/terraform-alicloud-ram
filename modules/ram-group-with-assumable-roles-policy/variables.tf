variable "region" {
  description = "The region used to launch this module resources."
  type        = string
  default     = ""
}

variable "profile" {
  description = "The profile name as set in the shared credentials file. If not set, it will be sourced from the ALICLOUD_PROFILE environment variable."
  type        = string
  default     = ""
}
variable "shared_credentials_file" {
  description = "This is the path to the shared credentials file. If this is not set and a profile is specified, $HOME/.aliyun/config.json will be used."
  type        = string
  default     = ""
}

variable "skip_region_validation" {
  description = "Skip static validation of region ID. Used by users of alternative AlibabaCloud-like APIs or users w/ access to regions that are not public (yet)."
  type        = bool
  default     = false
}

variable "policy_name" {
  description = "Name of RAM policy, If not set, a default name with prefix `assumable-roles-policy-` will be returned. "
  type        = string
  default     = ""
}

variable "group_name" {
  description = "Name of RAM group. If not set, a default name with prefix `group-assumable-roles-` will be returned."
  type        = string
  default     = ""
}

variable "force" {
  description = "This parameter is used for resource destroy"
  type        = bool
  default     = false
}

variable "user_names" {
  description = "List of RAM users to have in an RAM group which can assume the role"
  type        = list(string)
  default     = []
}

variable "assumable_roles" {
  description = "List of RAM roles ARNs which can be assumed by the group"
  type        = list(string)
  default     = []
}

variable "action" {
  description = "Operations on specific resources"
  type        = string
  default     = ""
}