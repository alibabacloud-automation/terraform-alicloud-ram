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

variable "get_caller_identity" {
  description = "Whether to get alicloud account ID, User ID in which Terraform is authorized"
  type        = bool
  default     = true
}

variable "account_alias" {
  description = "Alias of cloud account. If not set, a default name with prefix `ram-account-` will be returned."
  type        = string
  default     = ""
}

variable "create_account_password_policy" {
  description = "Whether to create alicloud RAM account password policy"
  type        = bool
  default     = true
}

variable "ram_account_password_policy" {
  description = "defaults from API docs"
  type        = map(string)
  default     = {}
}