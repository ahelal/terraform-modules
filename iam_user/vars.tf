/**
 * The module creates an IAM user.
 *
 * Usage:
 *
 *    module "my_user" {
 *      source     = "github.com/ahelal/terraform-modules/iam_user"
 *      name       = "user"
 *      path       = "/"
 *      destroy    = "true"
 *      public_key = "<pub key>"
 *    }
 *
 */

variable "name" {
  description = "A string that defines username"
  type        = "string"
}

variable "path" {
  description = "A string that defines AWS IAM userpaths "
  type        = "string"
  default     = "/"
}

/* When destroying this user, destroy even if it has non-Terraform-managed IAM access keys, login profile or
   MFA devices. Without force_destroy a user with non-Terraform-managed access keys and login profile will
   fail to be destroyed.*/
variable "destroy" {
  description = "A string that defines force destroy options"
  type        = "string"
  default     = "false"
}

variable "public_key" {
  description = "Public key for AWS Key pair"
  type        = "string"
  default     = ""
}
