# RAM user
variable "force_destroy" {
  description = "When destroying this user, destroy even if it has non-Terraform-managed ram access keys, login profile or MFA devices. Without force_destroy a user with non-Terraform-managed access keys and login profile will fail to be destroyed."
  type        = bool
  default     = false
}

# RAM login profile
variable "password" {
  description = "Login password of the user"
  type        = string
  default     = "YourPassword123!"
}