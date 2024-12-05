output "eks_cluster_name" {
  value = module.eks.cluster_id
}

output "worker_node_role_arn" {
  value = module.eks.node_groups["heksx-workers"].iam_role_arn
}