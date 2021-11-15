variable "password" {
  description = "Login password of the user"
  type        = string
  default     = "Yourpassword1234!"
}

variable "user_name" {
  description = "Name of the RAM user."
  type        = string
  default     = "tf_user_test_011"
}

variable "secret_file" {
  description = "A file used to store access key and secret key of ther user "
  type        = string
  default     = "secret.txt"
}

variable "force_destroy" {
  description = "When destroying this user, destroy even if it has non-Terraform-managed ram access keys, login profile or MFA devices. Without force_destroy a user with non-Terraform-managed access keys and login profile will fail to be destroyed."
  type        = bool
  default     = true
}
