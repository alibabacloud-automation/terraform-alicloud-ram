variable "region" {
  description = "(Deprecated from version 1.7.0)The region used to launch this module resources."
  type        = string
  default     = ""
}

variable "is_admin" {
  description = "Whether to grant admin permission"
  type        = bool
  default     = false
}

variable "is_reader" {
  description = "Whether to grant reader permission"
  type        = bool
  default     = false
}

variable "create_ram_user_login_profile" {
  description = "Whether to create ram user login profile"
  type        = bool
  default     = false
}

variable "create_ram_access_key" {
  description = "Whether to create ram access key"
  type        = bool
  default     = false
}

variable "name" {
  description = "Desired name for the ram user. If not set, a default name with prefix `ram-user-` will be returned."
  type        = string
  default     = ""
}

variable "password" {
  description = "Login password of the user"
  type        = string
  default     = ""
}

variable "secret_file" {
  description = "A file used to store access key and secret key of ther user "
  type        = string
  default     = "secret.txt"
}

variable "force_destroy" {
  description = "When destroying this user, destroy even if it has non-Terraform-managed ram access keys, login profile or MFA devices. Without force_destroy a user with non-Terraform-managed access keys and login profile will fail to be destroyed."
  type        = bool
  default     = false
}

