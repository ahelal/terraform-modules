variable "name" {
  description = "A string of group name"
  type        = "string"
}

variable "path" {
  description = "A string that defines AWS IAM group path"
  type        = "string"
  default     = "/"
}

variable "group_policy" {
  description = "A string of group policy"
  type        = "string"
  default     = ""
}

variable "policy_arn" {
  description = "A string for the group policy ARN"
  type = "string"
  default = ""
}

variable "group_membership" {
  description = "A list of users to associate with the group"
  type = "list"
  default = []

}