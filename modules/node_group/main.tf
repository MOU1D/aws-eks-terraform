resource "aws_eks_node_group" "this" {
  cluster_name    = var.cluster_name
  node_group_name = var.node_group_name
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.subnet_ids
  
  instance_types = var.instance_types
  disk_size      = var.disk_size
  
  scaling_config {
    desired_size = var.desired_size
    min_size     = var.min_size
    max_size     = var.max_size
  }
  
  # Optional: remote access to nodes
  dynamic "remote_access" {
    for_each = var.ssh_key_name != null ? [1] : []
    content {
      ec2_ssh_key               = var.ssh_key_name
      source_security_group_ids = var.source_security_group_ids
    }
  }
  
  # Optional: Labels for node group
  labels = var.labels
  
  # Optional: Taints for node group
  dynamic "taint" {
    for_each = var.taints
    content {
      key    = taint.value.key
      value  = taint.value.value
      effect = taint.value.effect
    }
  }
  
  tags = merge(
    var.tags,
    {
      "kubernetes.io/cluster/${var.cluster_name}" = "owned"
    }
  )
  
  lifecycle {
    create_before_destroy = true
  }
}
