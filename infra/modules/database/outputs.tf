output "db_name" {
  description = "Name of the database instance"
  value       = var.db_name
}

output "db_engine" {
  description = "Database engine"
  value       = var.db_engine
}

output "db_connection_string" {
  description = "Database connection string (simulated)"
  value       = "postgresql://${var.db_name}:5432/cloudnotes"
}

output "db_private_ip" {
  description = "Private IP address of the database (simulated)"
  value       = "10.0.2.10"
}
