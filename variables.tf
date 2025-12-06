variable "aws_region" {
  default = "ap-south-1"
}

variable "ecs_cluster_name" {
  default = "azodha-flask-cluster"
}

variable "ecs_service_name" {
  default = "azodha-flask-service"
}

variable "container_name" {
  default = "flask-app"
}

variable "container_image" {
  description = "ECR image URI with tag"
  type        = string
}

variable "container_port" {
  default = 5000
}

variable "desired_count" {
  default = 1
}
