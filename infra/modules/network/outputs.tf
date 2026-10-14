output "vpc_name" {
  description = "Name of the VPC network"
  value       = "${var.network_name}-vpc"
}

output "subnet_cidr" {
  description = "CIDR block of the subnet"
  value       = var.cidr
}

output "subnet_name" {
  description = "Name of the subnet"
  value       = "${var.network_name}-subnet"
}

output "firewall_name" {
  description = "Name of the firewall"
  value       = "${var.network_name}-firewall"
}

output "region" {
  description = "Region where network resources are deployed"
  value       = var.region
}
