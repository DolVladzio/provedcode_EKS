#########################################################################
# Outputs
#########################################################################
output "cluster_name" {
        value = var.AWS_EKS_CLUSTER_NAME
}
#-----------------------------------------------------
output "region" {
        value = var.AWS_REGION
}
#-----------------------------------------------------
output "private_subnets" {
        value = module.vpc.private_subnets
}
#-----------------------------------------------------
output "public_subnets" {
        value = module.vpc.public_subnets
}
#-----------------------------------------------------
output "eks_cluster_id" {
        value = module.eks.cluster_id
}
#-----------------------------------------------------
output "default_security_group_id" {
        value = module.vpc.default_security_group_id
}
#-----------------------------------------------------
output "intra_subnets" {
        value = module.vpc.intra_subnets
}
#-----------------------------------------------------
