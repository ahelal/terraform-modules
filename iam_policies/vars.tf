
variable "policyName" {
  description = "A list of policies"
  type        = "list"
}

/* required */
variable "policy" {
  description = "A map of AWS policies"
  type        = "map"
}

/* Defaults to "/" if not defined */
variable "policyPaths" {
  description = "A map of AWS policy paths"
  type        = "map"
  default     = {}
}

/* Defaults to "" if not defined */
variable "policyDescription" {
  description = "A map of AWS policy description"
  type        = "map"
  default     = {}
}
