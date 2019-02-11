variable "create_user" {
  description = "Whether to create the ram user"
  default     = true
}

variable "create_ram_user_login_profile" {
  description = "Whether to create ram user login profile"
  default     = true
}

variable "create_ram_access_key" {
  description = "Whether to create ram access key"
  default     = true
}

variable "name" {
  description = "Desired name for the ram user"
}

variable "password" {
  description = "password of ther user "
}

variable "secret_file" {
  description = "password of ther user "
  default     = "secret.txt"
}

variable "force_destroy" {
  description = "When destroying this user, destroy even if it has non-Terraform-managed ram access keys, login profile or MFA devices. Without force_destroy a user with non-Terraform-managed access keys and login profile will fail to be destroyed."
  default     = false
}
