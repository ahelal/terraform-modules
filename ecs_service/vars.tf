variable "name" {
  description = "xxxxxxxxxx"
  type        = "string"
  default     = ""
}

variable "ecs_cluster_name" {
  description = "cluster name to attach service to"
}

variable "desired_count" {
  description = "name of cluster we attach to"
  default     = 1
}

variable "environment" {
  type = "string"
}


variable "container_port" {
  default = 80
}

variable "host_port" {
  default = 0
}

variable "network_mode" {
  default = "bridge"
}

variable "container_memory_reservation" {
  default     = 512
  description = "The soft limit (in MiB) of memory to reserve for the container. When system memory is under contention, Docker attempts to keep the container memory to this soft limit; however, your container can consume more memory when it needs to"
}

variable "container_memory_hard" {
  default     = 1024
  description = "The hard limit (in MiB) of memory to present to the container. If your container attempts to exceed the memory specified here, the container is killed. Must be greater than container_memory_reservation"
}

variable "containers_cpu_unit" {
  default     = 256
  description = "The number of cpu units to reserve for the container. You can determine the number of CPU units that are available per Amazon EC2 instance type by multiplying the vCPUs listed for that instance type by 1024"
}

variable "containers_min" {
  default     = 2
  description = ""
}

variable "containers_max" {
  default     = 1000
  description = ""
}

variable "deployment_minimum_healthy_percent" {
  description = "The lower limit (as a percentage of the service's desiredCount) of the number of running tasks that must remain running and healthy in a service during a deployment."
  default     = "0"
}

variable "deployment_maximum_percent" {
  description = "The upper limit (as a percentage of the service's desiredCount) of the number of running tasks that can be running in a service during a deployment."
  default     = "100"
}

variable "image_tag" {
  type = "string"
}

variable "containers_desired" {
  description = "Desired numbers of containers always running"
  default     = "1"
}

variable "deregistration_delay" {
  description = "Delay (in seconds) to deregister green from the lb"
  default     = "300"
}

variable "livecheck_path" {
  default = "/livecheck"
}

variable "livecheck_interval" {
  default     = 10
  description = "The approximate amount of time, in seconds, between health checks of an individual target. Minimum value 5 seconds, Maximum value 300 seconds. Default 30 seconds."
}

variable "livecheck_healthy_threshold" {
  default     = 6
  description = "The number of consecutive health checks successes required before considering an unhealthy target healthy. Defaults to 5."
}

variable "livecheck_unhealthy_threshold" {
  default     = 2
  description = "The number of consecutive health check failures required before considering the target unhealthy. Defaults to 2."
}
