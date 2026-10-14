# Network outputs
output "vpc_name" {
  description = "Name of the VPC network"
  value       = module.network.vpc_name
}

output "web_subnet_cidr" {
  description = "CIDR block of the web subnet"
  value       = module.network.web_subnet_cidr
}

output "app_subnet_cidr" {
  description = "CIDR block of the app subnet"
  value       = module.network.app_subnet_cidr
}

output "db_subnet_cidr" {
  description = "CIDR block of the database subnet"
  value       = module.network.db_subnet_cidr
}

# Compute outputs
output "instance_name" {
  description = "Name of the compute instance"
  value       = module.compute.instance_name
}

output "instance_machine_type" {
  description = "Machine type of the compute instance"
  value       = module.compute.instance_machine_type
}

output "instance_ip" {
  description = "IP address of the compute instance"
  value       = module.compute.instance_ip
}

# Database outputs
output "db_name" {
  description = "Name of the database instance"
  value       = module.database.db_name
}

output "db_engine" {
  description = "Database engine"
  value       = module.database.db_engine
}

output "db_connection_string" {
  description = "Database connection string"
  value       = module.database.db_connection_string
}

output "db_private_ip" {
  description = "Private IP address of the database"
  value       = module.database.db_private_ip
}

# Storage outputs
output "bucket_name" {
  description = "Name of the storage bucket"
  value       = module.storage.bucket_name
}

output "bucket_url" {
  description = "URL of the storage bucket"
  value       = module.storage.bucket_url
}

# IAM outputs
output "service_account_email" {
  description = "Email of the service account"
  value       = module.iam.service_account_email
}

output "service_account_name" {
  description = "Name of the service account"
  value       = module.iam.service_account_name
}

# System outputs
output "region" {
  description = "Region where resources are deployed"
  value       = var.region
}

output "environment" {
  description = "Deployment environment"
  value       = var.environment
}
