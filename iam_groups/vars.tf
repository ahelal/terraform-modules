
variable "groups" {
  description = "A list of group users"
  type        = "list"
}

variable "groups_polices" {
  description = "A map of group policies"
  type        = "map"
  default = {}
}

variable "group_paths" {
  default = {}
}

variable "group_membership" {
  default = {}
}

