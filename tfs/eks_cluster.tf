provider "aws" {
  region = "ap-southeast-1"
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 20.0"

  cluster_name    = "heksx-cluster"
  cluster_version = var.cluster_version

  cluster_endpoint_public_access  = false
  cluster_endpoint_private_access = true

  eks_managed_node_groups = {
    heksx-workers = {
      desired_size = var.desired_size
      max_size     = var.max_size
      min_size     = var.min_size

      instance_types = var.instance_types

      tags = {
        "Name"    = "heksx-workers"
        "Project" = "heksx"
      }
    }
  }

  tags = {
    Project = "heksx"
  }
}