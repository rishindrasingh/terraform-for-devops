module "eks" {

  # Import the EKS module from the Terraform AWS Modules repository  
  source = "terraform-aws-modules/eks/aws"
  version = "~> 20.31"
  

  # EKS Cluster Information (Control Plane)
  cluster_name    = "${local.name}-eks-cluster"
  cluster_version = "1.31"
  cluster_endpoint_public_access    = true

  subnet_ids                       = module.vpc.private_subnets
  vpc_id                           = module.vpc.vpc_id

  cluster_addons = {
    coredns = {
      most_recent_version = true
    }
    kube-proxy = {
      most_recent_version = true
    }
    vpc-cni = {
      most_recent_version = true
    }
  }

  # control plane networks
  control_plane_subnet_ids = module.vpc.intra_subnets
  
  
  #Managing nodes in the EKS cluster
  eks_managed_node_group_defaults = {
    instance_types = ["t2.micro"]
  }
 
  eks_managed_node_groups = {
    example = {
      instance_types = ["t2.micro"]

      min_size     = 1
      max_size     = 2
      desired_size = 1
    }
  }

  tags = {
    Environment = local.Environment
    terraform   = "true"
  }
}