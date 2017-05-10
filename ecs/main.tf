/**
 * This module has a variable and an output.  This text here will be output before any inputs or outputs!
 */

// Fetch AWS AMI defaults ECS Optimized Linux AM check vars.tf
data "aws_ami" "ecs" {
  most_recent = true
  owners      = ["${var.aws_ami_owner}"]

  filter {
    name   = "name"
    values = ["${var.aws_ami_name_filter}"]
  }
}

// Create a AWS ECS Cluster
resource "aws_ecs_cluster" "cluster" {
  name = "${var.name}"
}
