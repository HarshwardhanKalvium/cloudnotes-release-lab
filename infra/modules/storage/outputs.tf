output "bucket_name" {
  description = "Name of the storage bucket"
  value       = var.bucket_name
}

output "bucket_url" {
  description = "URL of the storage bucket (simulated)"
  value       = "gs://${var.bucket_name}"
}

output "bucket_region" {
  description = "Region where the bucket is located"
  value       = var.region
}
