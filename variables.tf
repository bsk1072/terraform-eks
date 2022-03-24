## variables for creating vpc

variable "vpc_name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = "vpc-k8s"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = "172.16.0.0/16"
}

variable "azs" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
  default     = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
  default     = ["172.16.4.0/24", "172.16.5.0/24", "172.16.6.0/24"]
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
  default     = ["172.16.1.0/24", "172.16.2.0/24", "172.16.3.0/24"]
}

variable "enable_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
  type        = bool
  default     = true
}

#variable "public_subnet_tags" {
#  description = "Additional tags for the public subnets"
#  type        = map(string)
#  default     = {
#    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
#    "kubernetes.io/role/elb"                      = "1"
#  }
#}

#variable "private_subnet_tags" {
#  description = "Additional tags for the private subnets"
#  type        = map(string)
#  default     = {
#    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
#    "kubernetes.io/role/internal-elb"             = "1"
#  }
#}


## variables for eks cluster

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "my-cluster"
}

variable "eks_managed_node_groups" {
  description = "Map of EKS managed node group definitions to create"
  type        = any
  default     = {
    first = {
      desired_capacity = 1
      max_capacity     = 10
      min_capacity     = 1

      instance_type = "m5.large"
    }
  }
}

variable "write_kubeconfig" {
  description = "Should be true to enable kubeconfig to write"
  type        = bool
  default     = true
}
