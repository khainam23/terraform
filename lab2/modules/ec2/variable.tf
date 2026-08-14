variable "lab2_iam_role_log_id" {
  type = string
  description = "ID of the IAM role that should be granted access to the logs bucket"
}

variable "lab2_instance_profile_name" {
  type       = string
  description = "Name of the IAM instance profile"
}

variable "lab2_vpc_id" {
  type        = string
  description = "ID of the VPC where the security group will be created"
}

variable "public_subnet_1_id" {
  type        = string
  description = "ID of the first public subnet"
}

variable "public_subnet_2_id" {
  type        = string
  description = "ID of the second public subnet"
}

variable "lab2_public_sg_id"  {
  type        = string
  description = "ID of the public security group"
}