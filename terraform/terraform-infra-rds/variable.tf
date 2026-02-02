variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "ap-south-1"
}
variable "dbstorage" {
  description = "The allocated storage for the RDS instance in GB"
  type        = number
  default     = 20
}
variable "private_subnets" {
  description = "List of private subnet IDs for the RDS subnet group"
  type        = list(string)
  default     = ["subnet-0ba68274d4a3b49e8", "subnet-010a5ebf1e2dd68d7"]
}
variable "vpc_id" {
  description = "The VPC ID where RDS will be deployed"
  type        = string
  default     = "vpc-0ff69fc3a95e5d2af"
}

variable "eks_node_sg_id" {
  description = "The security group ID of the EKS worker nodes"
  type        = string
  default     = "sg-0977db6ce307159b1"
}