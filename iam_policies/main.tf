resource "aws_iam_policy" "hf_iam_policy" {
  count       = "${length(var.policyName)}"
  name        = "${element(var.policyName, count.index)}"
  path        = "${lookup(var.policyPaths, element(var.policyName, count.index), "/")}"
  description = "${lookup(var.policyDescription, element(var.policyName, count.index), "")}"
  policy      = "${lookup(var.policy, element(var.policyName, count.index), "")}"
}
