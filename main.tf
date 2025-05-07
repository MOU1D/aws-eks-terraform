provider "aws" {
  region = var.region
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.20"
    }
  }
  required_version = ">= 1.0"
}

module "vpc" {
  source = "./modules/vpc"
  
  vpc_name       = var.vpc_name
  vpc_cidr       = var.vpc_cidr
  azs            = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  
  tags = var.tags
}

module "iam" {
  source = "./modules/iam"
  
  cluster_name = var.cluster_name
  tags         = var.tags
}

module "eks" {
  source = "./modules/eks"
  
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnets
  
  cluster_role_arn = module.iam.cluster_role_arn
  
  tags = var.tags
  
  depends_on = [module.vpc, module.iam]
}

module "node_group" {
  source = "./modules/node_group"
  
  cluster_name      = module.eks.cluster_name
  node_group_name   = var.node_group_name
  node_role_arn     = module.iam.node_role_arn
  subnet_ids        = module.vpc.private_subnets
  
  instance_types    = var.instance_types
  desired_size      = var.desired_size
  min_size          = var.min_size
  max_size          = var.max_size
  disk_size         = var.disk_size
  
  tags = var.tags
  
  depends_on = [module.eks]
}
