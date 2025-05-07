variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "node_group_name" {
  description = "Name of the EKS node group"
  type        = string
}

variable "node_role_arn" {
  description = "ARN of the IAM role for the EKS nodes"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS node group"
  type        = list(string)
}

variable "instance_types" {
  description = "List of instance types for the EKS node group"
  type        = list(string)
  default     = ["t3.micro"]
}

variable "disk_size" {
  description = "Disk size in GiB for the EKS node group instances"
  type        = number
  default     = 20
}

variable "desired_size" {
  description = "Desired number of nodes in the EKS node group"
  type        = number
  default     = 1
}

variable "min_size" {
  description = "Minimum number of nodes in the EKS node group"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum number of nodes in the EKS node group"
  type        = number
  default     = 2
}

variable "ssh_key_name" {
  description = "SSH key name that should be used to access the worker nodes"
  type        = string
  default     = null
}

variable "source_security_group_ids" {
  description = "List of security group IDs that are allowed SSH access to the worker nodes"
  type        = list(string)
  default     = []
}

variable "labels" {
  description = "Key-value mapping of Kubernetes labels for the node group"
  type        = map(string)
  default     = {}
}

variable "taints" {
  description = "List of Kubernetes taints to apply to the nodes"
  type        = list(object({
    key    = string
    value  = string
    effect = string
  }))
  default     = []
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
