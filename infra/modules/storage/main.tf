terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

# Storage bucket resource
resource "local_file" "storage_bucket" {
  filename = "${path.module}/../../.generated/${var.bucket_name}.json"
  content = jsonencode({
    name          = var.bucket_name
    project       = var.project
    region        = var.region
    storage_class = var.storage_class
    force_destroy = var.force_destroy
    description   = "CloudNotes storage bucket for assets"
  })
}
