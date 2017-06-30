resource "aws_iam_policy" "hf_iam_policy" {
  name        = "${var.policyName}"
  path        = "${var.policyPath}"
  description = "${var.policyDescription}"
  policy      = "${var.policy}"
}
