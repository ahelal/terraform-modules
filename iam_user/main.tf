
resource "aws_iam_user" "iam_user" {
  name          = "${var.name}"
  path          = "${var.path}"
  force_destroy = "${var.destroy}"

  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_key_pair" "aws_keypair" {
  count         = "${var.public_key == '' ? 0 : 1}"
  key_name      = "${var.name}"
  public_key    = "${var.public_key}"
}
