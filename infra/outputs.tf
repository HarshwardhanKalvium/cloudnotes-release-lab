output "vpc_name" {
  description = "Name of the VPC network"
  value       = "${var.project}-vpc"
}

output "subnet_cidr" {
  description = "CIDR block of the subnet"
  value       = var.subnet_cidr
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
