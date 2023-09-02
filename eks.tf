resource "aws_eks_cluster" "capstone_eks_cluster" {
    name = "capstone_project3_eks_cluster"
    role_arn = aws_iam_role.capstone_eks_cluster_role.arn
    vpc_config {
	subnet_ids = [aws_subnet.capstone_subnet_a.id,aws_subnet.capstone_subnet_b.id,aws_subnet.capstone_subnet_c.id]
    }
    tags = {
	Name = "Capstone-Project3-EKS-Cluster"
    }
    depends_on = [
	aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
  	aws_iam_role_policy_attachment.AmazonEKSServicePolicy
    ]
}

resource "aws_eks_node_group" "capstone_eks_node_group" {
    cluster_name = aws_eks_cluster.capstone_eks_cluster.name
    node_group_name = "capstone_node_group"
    node_role_arn = aws_iam_role.capstone_eks_cluster_role.arn
    subnet_ids = [aws_subnet.capstone_subnet_a.id,aws_subnet.capstone_subnet_b.id,aws_subnet.capstone_subnet_c.id]
    scaling_config {
      desired_size = 1
      max_size = 2
      min_size = 1
   }
    depends_on =[
	aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
	aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
	aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly
 ]
}
