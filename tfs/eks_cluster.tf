provider "aws" {
  region = "ap-southeast-1"
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 20.0"

  cluster_name    = "heksx-cluster"
  cluster_version = "1.31"

  cluster_endpoint_public_access  = false
  cluster_endpoint_private_access = true

  eks_managed_node_groups = {
    heksx-workers = {
      desired_size = 2
      max_size     = 3
      min_size     = 2

      instance_types = ["m6i.large"] # Change to G5 if higher requirement is needed

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