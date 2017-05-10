
// Data about the cluster we are going to deploy to
data "aws_ecs_cluster" "ecs_cluster" {
  cluster_name = "${var.ecs_cluster_name}"
}

// x
data "template_file" "task_definition" {
  template = "${file("${path.module}/task-definitions/simple_bridge.json")}"

  vars {
    image_tag        = "${var.image_tag}"
    container_name   = "${var.name}-${var.environment}"
    cpu_unit         = "${var.containers_cpu_unit}"
    memory_soft      = "${var.container_memory_reservation}"
    memory_hard      = "${var.container_memory_hard}"
    container_port   = "${var.container_port}"
    host_port        = "${var.host_port}"
    environment      = "${var.environment}"
  }
}

# CREATE AN ECS SERVICE TO RUN A LONG-RUNNING ECS TASK
# We also associate the ECS Service with an ELB, which can distribute traffic across the ECS Tasks.
resource "aws_ecs_service" "service" {
  name            = "${var.name}"
  cluster         = "${data.aws_ecs_cluster.ecs_cluster.id}"
  task_definition = "${aws_ecs_task_definition.task.arn}"
  desired_count   = "${var.desired_count}"

  #iam_role        = "${aws_iam_role.ecs_service_role.arn}"

  deployment_minimum_healthy_percent = "${var.deployment_minimum_healthy_percent}"
  deployment_maximum_percent         = "${var.deployment_maximum_percent}"

  #depends_on                         = ["aws_iam_role_policy.ecs_service_policy"]
}

# CREATE AN ECS TASK TO RUN A DOCKER CONTAINER
resource "aws_ecs_task_definition" "task" {
  family = "${var.name}"
  container_definitions = "${data.template_file.task_definition.rendered}"
  network_mode = "${var.network_mode}"
  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [eu-west-1a, eu-west-1b]"
  }
}
