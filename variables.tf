#########################################################################
# Variables
#########################################################################
locals {
	private_subnets = [var.AWS_PRIVATE_SUBNET_1, var.AWS_PRIVATE_SUBNET_2]
	public_subnets  = [var.AWS_PUBLIC_SUBNET_1, var.AWS_PUBLIC_SUBNET_2]
	intra_subnets   = [var.AWS_INTRA_SUBNET_1, var.AWS_INTRA_SUBNET_2]
	azs             = ["${var.AWS_REGION}a", "${var.AWS_REGION}b"]
}
#----------------------------------------------------
variable "AWS_EKS_CLUSTER_NAME" {
	description = "The name of the Kubernetes cluster"
	default     = "k8s-EKS"
}
#----------------------------------------------------
variable "AWS_REGION" {
	description = "AWS region"
	default     = "eu-central-1"
}
#----------------------------------------------------
variable "AWS_VPC_CIDR" {
	description = "The CIDR block for the VPC"
	default     = "10.123.0.0/16"
}
#----------------------------------------------------
variable "AWS_PUBLIC_SUBNET_1" {
	description = "Public_subnet-1"
	default     = "10.123.1.0/24"
}
#----------------------------------------------------
variable "AWS_PUBLIC_SUBNET_2" {
	description = "Public_subnet-2"
	default     = "10.123.2.0/24"
}
#----------------------------------------------------
variable "AWS_PRIVATE_SUBNET_1" {
	description = "Private_subnet-1"
	default     = "10.123.3.0/24"
}
#----------------------------------------------------
variable "AWS_PRIVATE_SUBNET_2" {
	description = "Private_subnet-2"
	default     = "10.123.4.0/24"
}
#----------------------------------------------------
variable "AWS_INTRA_SUBNET_1" {
	description = "Intra_subnet-1"
	default     = "10.123.5.0/24"
}
#----------------------------------------------------
variable "AWS_INTRA_SUBNET_2" {
	description = "Intra_subnet-2"
	default     = "10.123.6.0/24"
}
#########################################################################
