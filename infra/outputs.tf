output "web_vpc_name" {
  description = "Name of the web tier VPC network"
  value       = module.web_network.vpc_name
}

output "web_subnet_cidr" {
  description = "CIDR block of the web subnet"
  value       = module.web_network.subnet_cidr
}

output "app_vpc_name" {
  description = "Name of the app tier VPC network"
  value       = module.app_network.vpc_name
}

output "app_subnet_cidr" {
  description = "CIDR block of the app subnet"
  value       = module.app_network.subnet_cidr
}

output "instance_name" {
  description = "Name of the compute instance"
  value       = "${var.project}-instance"
}

output "instance_machine_type" {
  description = "Machine type of the compute instance"
  value       = var.machine_type
}

output "bucket_name" {
  description = "Name of the storage bucket"
  value       = var.bucket_name
}

output "region" {
  description = "Region where resources are deployed"
  value       = var.region
}
