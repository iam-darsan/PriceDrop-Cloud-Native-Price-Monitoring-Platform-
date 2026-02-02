variable "repository_name" {
  description = "The name of the ECR repository"
  type        = string
  default     = "pricedrop-backend"
}

variable "image_tag" {
  description = "The image tag mutability setting for the ECR repository"
  type        = string
  default     = "MUTABLE"
}

variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "ap-south-1"
}