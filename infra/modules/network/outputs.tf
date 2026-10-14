output "vpc_name" {
  description = "Name of the VPC network"
  value       = "${var.network_name}-vpc"
}

output "web_subnet_name" {
  description = "Name of the web subnet"
  value       = "${var.network_name}-web-subnet"
}

output "web_subnet_cidr" {
  description = "CIDR block of the web subnet"
  value       = var.web_subnet_cidr
}

output "app_subnet_name" {
  description = "Name of the app subnet"
  value       = "${var.network_name}-app-subnet"
}

output "app_subnet_cidr" {
  description = "CIDR block of the app subnet"
  value       = var.app_subnet_cidr
}

output "db_subnet_name" {
  description = "Name of the database subnet"
  value       = "${var.network_name}-db-subnet"
}

output "db_subnet_cidr" {
  description = "CIDR block of the database subnet"
  value       = var.db_subnet_cidr
}

output "firewall_name" {
  description = "Name of the firewall"
  value       = "${var.network_name}-firewall"
}

output "region" {
  description = "Region where network resources are deployed"
  value       = var.region
}
