variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "eks-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "Availability zones for VPC"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "private_subnets" {
  description = "Private subnets for VPC"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnets" {
  description = "Public subnets for VPC"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "eks-cluster"
}

variable "cluster_version" {
  description = "Kubernetes version to use for the EKS cluster"
  type        = string
  default     = "1.28"
}

variable "node_group_name" {
  description = "Name of the EKS node group"
  type        = string
  default     = "eks-node-group"
}

variable "instance_types" {
  description = "Instance types for the EKS node group"
  type        = list(string)
  default     = ["t3.small"]
}

variable "desired_size" {
  description = "Desired size of the EKS node group"
  type        = number
  default     = 1
}

variable "min_size" {
  description = "Minimum size of the EKS node group"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum size of the EKS node group"
  type        = number
  default     = 2
}

variable "disk_size" {
  description = "Disk size for each node (in GB)"
  type        = number
  default     = 20
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {
    Environment = "Development"
    Project     = "EKS-Terraform"
    Terraform   = "true"
  }
}
