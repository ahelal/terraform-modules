
variable "policyName" {
  description = "Policy name"
  type        = "string"
}

/* required */
variable "policy" {
  description = "AWS policy"
  type        = "string"
}

/* Defaults to "/" if not defined */
variable "policyPath" {
  description = "AWS policy path"
  type        = "string"
  default     = "/"
}

/* Defaults to "" if not defined */
variable "policyDescription" {
  description = "AWS policy description"
  type        = "string"
  default     = ""
}
