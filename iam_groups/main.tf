
resource "aws_iam_group" "iam_groups" {
    count= "${length(var.groups)}"
    name = "${element(var.groups, count.index)}"
    path = "${lookup(var.group_paths, element(var.groups, count.index), "/")}"
}

resource "aws_iam_group_policy_attachment" "iam_groups_policies" {
    count      = "${length(var.groups_polices)}"
    group      = "${element(keys(var.groups_polices), count.index)}"
    policy_arn = "${lookup(var.groups_polices, element(keys(var.groups_polices), count.index) )}"
}

resource "aws_iam_group_membership" "group_membership" {
    count = "${length(var.group_membership)}"
    name  = "tf-testing-group-membership"
    /*
        compact   : Remove empty items from list
        split     : Explode comma seperated string to list
        Replace   : Trim spaces
        lookup    : Gets users string by key "group" from group_membership
        element   : Gets a list of keys and use index to get map
    */
    users = "${ compact( split(",", replace(lookup(var.group_membership, element(keys(var.group_membership), count.index)), " ", "") ))}"
    # Gets a list of keys and use index to get map
    group = "${element(keys(var.group_membership), count.index)}"
}