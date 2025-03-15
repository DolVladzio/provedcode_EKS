#########################################################################
# Modules 
#########################################################################
module "vpc" {
	source  = "terraform-aws-modules/vpc/aws"
	version = "~> 4.0"

	name = var.AWS_EKS_CLUSTER_NAME
	cidr = var.AWS_VPC_CIDR

	azs             = local.azs
	private_subnets = local.private_subnets
	public_subnets  = local.public_subnets
	intra_subnets   = local.intra_subnets

	enable_nat_gateway     = true
	single_nat_gateway     = true
	enable_dns_hostnames   = true
	enable_dns_support     = true
	create_igw             = true
	map_public_ip_on_launch = true

	public_subnet_tags = {
		"kubernetes.io/role/elb" = 1
	}

	private_subnet_tags = {
		"kubernetes.io/role/internal-elb" = 1
	}
}
#########################################################################
module "eks" {
	source  = "terraform-aws-modules/eks/aws"
	version = "20.31"

	cluster_name                   = module.vpc.name
	cluster_endpoint_public_access = true
	enable_cluster_creator_admin_permissions = true

	vpc_id                         = module.vpc.vpc_id
	subnet_ids                     = module.vpc.private_subnets
	control_plane_subnet_ids       = module.vpc.intra_subnets
	cluster_security_group_id      = module.vpc.default_security_group_id
	
	cluster_addons = {
		coredns = { most_recent = true }
		kube-proxy = { most_recent = true }
		vpc-cni = { most_recent = true }
	}

	eks_managed_node_groups = {
		ascode-cluster-wg = {
			min_size     = 1
			max_size     = 2
			desired_size = 1

			instance_types = ["t3.large"]
			capacity_type  = "SPOT"

			lifecycle = {
					create_before_destroy = true
			}
		}
	}

	depends_on = [ module.vpc ]
}
#########################################################################
