output "eks_cluster_name" {
  description = "EKS Cluster name"
  value = module.eks.cluster_id
}

output "vpc_id" {
  description = "VPC ID"
  value = module.vpc.vpc_id
}

output "worker_role_arn" {
  description = "Worker node role ARN"
  value = aws_iam_role.eks_node_role.arn
}

output "private_subnet" {
  description = "Private subnet"
  value = module.vpc.private_subnets
}

output "public_submet" {
  description = "Public subnet"
  value = module.vpc.public_subnets
}

output "security_groups" {
  description = "Security groups"
  value = module.vpc.security_groups_ids
}

output "ebs_volume_id" {
  value = module.eks.managed_node_groups["heksx-workers"].instance_ids
}
