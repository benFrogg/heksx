# heksx  
### Components  
1. EKS Cluster  
>- At least 2 nodes, maximum of 3 nodes  
>- Using version 1.31  
>- VPC accessible only  
>- Worker nodes instance is m6i.large, change to g5 series for higher performance  
  
2. VPC  
>- CIDR range 10.0.0.0/16  
>- Private Subnet 10.0.1.0/24 and 10.0.2.0/24  
>- Public Subnet 10.0.101.0/24 and 10.0.102.0/24  
>- Nat Gateway enabled for Private subnet to have internet access  
  
3. IAM roles  
>- EKS cluster roles using AmazonEKSClusterPolicy  
>- WOrker node roles using AmazonEKSWorkerNodePolicy, AmazonEC2ContainerRegistryReadOnly and AmazonEKS_CNI_Policy  
  
4. EBS  
>- Size 500GiB, change to TBs for higher load  
>- Type gp3 for good balance between cost and performance  
  
### Run project  
1. Ensure Terraform is installed  
2. Ensure AWS CLI is installed and configure credentials using "aws configure"  
3. Ensure sufficient IAM permission to manage required resources  
4. Clone repo "git clone <repo_id>"  
5. Initialize terraform "terraform init"  
6. Review upcoming changes "terraform plan"  
7. Retrieve worker instance ID "INSTANCE_ID=$(terraform output -json | jq -r '.worker_instance_ids[0]')"
7. Apply the changes "terraform apply -var='eks_instance_id=${INSTANCE_ID}'"  
8. (Optional) Redo by destroying all created "terraform destroy"  
