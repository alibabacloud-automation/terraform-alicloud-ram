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
  description = "Name of the RAM user. If not set, a default name with prefix `ram-user-` will be returned."
  type        = string
  default     = ""
}

variable "display_name" {
  description = "Name of the RAM user which for display"
  type        = string
  default     = ""
}

variable "mobile" {
  description = "Phone number of the RAM user"
  type        = string
  default     = ""
}

variable "email" {
  description = "Email of the RAM user"
  type        = string
  default     = ""
}
variable "force" {
  description = "This parameter is used for resource destroy"
  type        = bool
  default     = false
}
variable "comments" {
  description = "Comment of the RAM user"
  type        = string
  default     = ""
}

variable "password" {
  description = "Password of the RAM user"
  type        = string
  default     = ""
}

variable "password_reset_required" {
  description = "This parameter indicates whether the password needs to be reset when the user first logs in"
  type        = bool
  default     = false
}

variable "mfa_bind_required" {
  description = "This parameter indicates whether the MFA needs to be bind when the user first logs in"
  type        = bool
  default     = false
}

variable "secret_file" {
  description = "The name of file that can save access key id and access key secret"
  type        = string
  default     = ""
}

variable "status" {
  description = "Status of access key"
  type        = string
  default     = "Active"
}

variable "pgp_key" {
  description = "Either a base-64 encoded PGP public key, or a keybase username in the form"
  type        = string
  default     = ""
}


variable "create_user" {
  description = "Whether to create the RAM user"
  type        = bool
  default     = true
}

variable "create_ram_user_login_profile" {
  description = "Whether to create RAM user login profile"
  type        = bool
  default     = true
}

variable "create_ram_access_key" {
  description = "Whether to create RAM access key"
  type        = bool
  default     = true
}