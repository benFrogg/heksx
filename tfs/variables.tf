variable "region" {
  description = "AWS region"
  type = string
  default = "ap-southeast-1"
}

variable "cluster_version" {
  description = "EKS cluster version"
  type = string
  default = "1.31"
}

variable "desired_size" {
  description = "Desired size of the worker node"
  type = number
  default = 2
}

variable "min_size" {
  description = "Minimum size of the worker node"
  type = number
  default = 2
}

variable "max_size" {
  description = "Maximum size of the worker node"
  type = number
  default = 3
}

variable "instance_types" {
  description = "Instance types for the worker node"
  type = list(string)
  default = ["m6i.large"] # Change to G5 series if higher performance is needed
}

variable "ebs_volume_size" {
  description = "EBS size"
  type = number
  default = 500
}

variable "ebs_volume_type" {
  description = "EBS type"
  type = string
  default = "gp3"
}

variable "eks_instance_id" {
  description = "Worker with EBS attached"
  type = string
}