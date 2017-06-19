
resource "aws_iam_user" "iam_user" {
  name          = "${var.name}"
  path          = "${var.path}"
  force_destroy = "${var.destroy}"

  lifecycle {
    create_before_destroy = true
  }

}
