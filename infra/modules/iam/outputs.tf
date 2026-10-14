output "service_account_name" {
  description = "Name of the service account"
  value       = var.app_sa_name
}

output "service_account_email" {
  description = "Email of the service account"
  value       = "${var.app_sa_name}@${var.project}.iam.gserviceaccount.com"
}

output "roles_count" {
  description = "Number of roles granted to the service account"
  value       = length(var.roles)
}
