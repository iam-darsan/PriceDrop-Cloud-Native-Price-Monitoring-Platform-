variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "frontend_bucket_name" {
  description = "S3 bucket name for frontend"
  type        = string
  default     = "pricedropper-frontend-bucket-30-1-2026"
}
