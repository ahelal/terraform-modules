
resource "aws_iam_user" "iam_user" {
  count         = "${length(var.usernames)}"
  name          = "${element(var.usernames, count.index)}"
  path          = "${lookup(var.paths, element(var.usernames, count.index), "/")}"
  force_destroy = "${lookup(var.destroys, element(var.usernames, count.index), false )}"
  force_destroy_default= "${var.force_destroy_default}"
}
