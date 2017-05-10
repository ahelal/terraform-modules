# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED MODULE PARAMETERS
# These variables must be passed in by the operator.
# ---------------------------------------------------------------------------------------------------------------------

variable "name" {
  description = "The name of the ECS Cluster."
}

variable "size" {
  description = "The number of EC2 Instances to run in the ECS Cluster."
}

variable "instance_type" {
  description = "The type of EC2 Instance to deploy in the ECS Cluster (e.g. t2.micro)."
}

variable "vpc_id" {
  description = "The ID of the VPC in which to deploy the ECS Cluster."
}

variable "subnet_ids" {
  description = "The subnet IDs in which to deploy the EC2 Instances of the ECS Cluster."
  type        = "list"
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL MODULE PARAMETERS
# These variables have defaults, but may be overridden by the operator.
# ---------------------------------------------------------------------------------------------------------------------

variable "security_group" {
  description = "A list of security groups "
  type        = "list"
  default     = []
}

variable "key_pair_name" {
  description = "The name of an EC2 Key Pair to associate with each EC2 Instance in the ECS Cluster. Leave blank to not associate a Key Pair."
  default     = ""
}

// AWS AMI OWNER
variable "aws_ami_owner" {
  description = "A list of security groups "
  default     = "amazon"
}

// AWS filter name
variable "aws_ami_name_filter" {
  description = "The name to use to filter the AMI"
  default     = "amzn-ami-*-amazon-ecs-optimized"
}
