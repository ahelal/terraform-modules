# # ---------------------------------------------------------------------------------------------------------------------
# # DEPLOY AN AUTO SCALING GROUP (ASG)
# # Each EC2 Instance in the ASG will register as an ECS Cluster Instance.
# # ---------------------------------------------------------------------------------------------------------------------
resource "aws_autoscaling_group" "ecs_cluster_instances" {
  name                 = "${var.name}"
  min_size             = "${var.size}"
  max_size             = "${var.size}"
  launch_configuration = "${aws_launch_configuration.ecs_instance.name}"
  vpc_zone_identifier  = ["${var.subnet_ids}"]

  tag {
    key                 = "Name"
    value               = "${var.name}"
    propagate_at_launch = true
  }
}

# The launch configuration for each EC2 Instance that will run in the ECS
# Cluster
resource "aws_launch_configuration" "ecs_instance" {
  name_prefix                 = "${var.name}-"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.key_pair_name}"
  iam_instance_profile        = "${aws_iam_instance_profile.ecs_instance.name}"
  security_groups             = ["${var.security_group}"]
  image_id                    = "${data.aws_ami.ecs.id}"
  associate_public_ip_address = true

  # A shell script that will execute when on each EC2 instance when it first boots to configure the ECS Agent to talk
  # to the right ECS cluster
  user_data = <<EOF
#!/bin/bash
echo "ECS_CLUSTER=${var.name}" >> /etc/ecs/ecs.config
EOF

  # Important note: whenever using a launch configuration with an auto scaling
  # group, you must set create_before_destroy = true. However, as soon as you
  # set create_before_destroy = true in one resource, you must also set it in
  # every resource that it depends on, or you'll get an error about cyclic
  # dependencies (especially when removing resources). For more info, see:
  #
  # https://www.terraform.io/docs/providers/aws/r/launch_configuration.html
  # https://terraform.io/docs/configuration/resources.html
  lifecycle {
    create_before_destroy = true
  }
}
