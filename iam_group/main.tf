resource "aws_iam_group" "iam_group" {
    name = "${var.name}"
    path = "${var.path}"
}

resource "aws_iam_group_policy_attachment" "iam_groups_policy" {
    group      = "${var.name}"
    policy_arn = "${var.policy_arn}"
}

resource "aws_iam_group_membership" "group_membership" {
    name  = "tf-testing-group-membership"
    users = "${var.group_membership}"
    # Gets a list of keys and use index to get map
    group = "${var.name}"
}
