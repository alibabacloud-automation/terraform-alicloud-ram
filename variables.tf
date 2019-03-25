variable "is_admin" {
  description = "Whether to grant admin permission"
  default     = false
}

variable "is_reader" {
  description = "Whether to grant reader permission"
  default     = false
}

variable "create_ram_user_login_profile" {
  description = "Whether to create ram user login profile"
  default     = false
}

variable "create_ram_access_key" {
  description = "Whether to create ram access key"
  default     = false
}

variable "name" {
  description = "Desired name for the ram user"
}

variable "password" {
  description = "Login password of the user"
  default = ""
}

variable "secret_file" {
  description = "A file used to store access key and secret key of ther user "
  default     = "secret.txt"
}

variable "force_destroy" {
  description = "When destroying this user, destroy even if it has non-Terraform-managed ram access keys, login profile or MFA devices. Without force_destroy a user with non-Terraform-managed access keys and login profile will fail to be destroyed."
  default     = false
}
