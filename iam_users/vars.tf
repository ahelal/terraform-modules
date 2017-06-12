variable "usernames" {
  description = "A list of IAM Users"
  type        = "list"
}

/* Defaults to "/" if not defined */
variable "paths" {
  description = "A map that defines AWS IAM userpaths "
  type        = "map"
  default     = {}
}

/* Defaults to false if not defined https://www.terraform.io/docs/providers/aws/r/iam_user.html#force_destroy*/
variable "destroys" {
  description = "A map of users force destroy options"
  type        = "map"
  default     = {}
}

variable "force_destroy_default" {
  description = "Default force destroy value"
  default     = false
}

/*
## Vars boiler plate module vars
variable "usernames" {
  type = "list"
}
variable "paths" {
  type = "map"
}
variable "destroys" {
  type = "map"
}
*/


/*
## Example module
usernames = ["neo", "trinity", "morpheus"]
paths = {
  neo     = "/matrix/clevel"
  trinity = "/matrix/it"
  # morpheus will default to "/" path since not defined
}
destroys = {
  neo     =  true
  # morpheus and trinity will default to false since not defined
}
*/

